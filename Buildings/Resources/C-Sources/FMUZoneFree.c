/*
 * Modelica external function to communicate with EnergyPlus.
 *
 * Michael Wetter, LBNL                  2/14/2018
 * Thierry S. Nouidui, LBNL              4/03/2018
 */

#include "FMUZoneFree.h"
#include "FMUEnergyPlusStructure.c"

#include <stdlib.h>

void FMUBuildingFree(FMUBuilding* ptrBui){
  fmi2String log = NULL;
  if ( ptrBui != NULL ){
    printf("Closing EnergyPlus library for %s.\n", ptrBui->name);
    ModelicaFormatMessage("Closing EnergyPlus library for %s.\n", ptrBui->name);
    writeLog(1, "Calling terminate on EnergyPlus library.");
    ptrBui->fmu->terminateSim(&log);
    writeLog(1, "Returned from terminate on EnergyPlus library.");
    free(ptrBui->name);
    free(ptrBui->weather);
    free(ptrBui->idd);
    free(ptrBui->epLib);
    free(ptrBui->zoneNames);
    free(ptrBui->zones);
    free(ptrBui->tmpDir);
    writeLog(1, "Freed pointers.");

#ifdef _MSC_VER
    if (!FreeLibrary(ptrBui->fmu->dllHandle)){
      ModelicaMessage("Warning: Failed to free EnergyPlus library.");
    }
#else
    writeLog(1, "Calling dlclose.");
   if (0 != dlclose(ptrBui->fmu->dllHandle)){
      ModelicaMessage("Warning: Failed to free EnergyPlus library.");
    }
#endif
    writeLog(1, "Closed EnergyPlus library.");
    free(ptrBui);
    writeLog(1, "Closed EnergyPlus library.");

  }
}

void FMUZoneFree(void* object){
  ModelicaMessage("*** Entered FMUZoneFree.\n");
  if ( object != NULL ){
    FMUZone* zone = (FMUZone*) object;
    /* Free the memory for the zone name in the structure
       of the FMU for this building. We simply remove one
       name, which may not be for this zone. But this does not matter
       as anyway all zones will be deconstructed by Modelica. */
    free(zone->ptrBui->zoneNames[zone->ptrBui->nZon - 1]);
    /* free(zone->ptrBui->zones[zone->ptrBui->nZon - 1]); */
    zone->ptrBui->nZon--;
    /* Check if the building FMU can be freed. */
    if (zone->ptrBui->nZon == 0){
      /* There is no more zone that uses this building FMU. */
      FMUBuildingFree(zone->ptrBui);
      decrementBuildings_nFMU();
    }
    free(zone);
    ModelicaMessage("*** Freed zone.\n");
  }
  ModelicaMessage("*** Leaving FMUZoneFree.\n");
}
