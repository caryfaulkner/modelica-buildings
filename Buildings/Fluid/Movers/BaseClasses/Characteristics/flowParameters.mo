within Buildings.Fluid.Movers.BaseClasses.Characteristics;
record flowParameters "Record for flow parameters"
  extends Modelica.Icons.Record;

  parameter Modelica.SIunits.VolumeFlowRate V_flow[:](each min=0)
    "Volume flow rate at user-selected operating points";
  parameter Modelica.SIunits.Pressure dp[size(V_flow,1)](
     each min=0, each displayUnit="Pa")
    "Fan or pump total pressure at these flow rates";

  annotation (Documentation(info="<html>
<p>
Data record for performance data that describe volume flow rate versus
pressure rise.
The volume flow rate <code>V_flow</code> must be increasing, i.e.,
<code>V_flow[i] &lt; V_flow[i+1]</code>.
Both vectors, <code>V_flow</code> and <code>dp</code>
must have the same size.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 28, 2011, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end flowParameters;
