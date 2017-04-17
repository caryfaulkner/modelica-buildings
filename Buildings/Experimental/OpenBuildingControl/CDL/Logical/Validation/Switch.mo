within Buildings.Experimental.OpenBuildingControl.CDL.Logical.Validation;
model Switch "Validation model for the Switch block"
extends Modelica.Icons.Example;

  Buildings.Experimental.OpenBuildingControl.CDL.Continuous.Ramp ramp1(
    duration=5,
    offset=-1,
    height=6)  "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-26,22},{-6,42}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Continuous.Ramp ramp2(
    duration=5,
    offset=-1,
    height=2) "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-26,-42},{-6,-22}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Sources.DutyCycle dutCyc(
    cycleOn = true,
    period = 2)
    "Block that output cyclic on and off"
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Continuous.Constant cons1(k=50) "Constant as source term"
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));

  Buildings.Experimental.OpenBuildingControl.CDL.Logical.Switch switch1
    annotation (Placement(transformation(extent={{26,-10},{46,10}})));

equation
  connect(cons1.y, dutCyc.u)
    annotation (Line(points={{-55,0},{-42,0},{-28,0}}, color={0,0,127}));
  connect(dutCyc.y, switch1.u2)
    annotation (Line(points={{-5,0},{10,0},{24,0}}, color={255,0,255}));
  connect(ramp2.y, switch1.u3) annotation (Line(points={{-5,-32},{8,-32},{8,-8},
          {24,-8}}, color={0,0,127}));
  connect(ramp1.y, switch1.u1)
    annotation (Line(points={{-5,32},{8,32},{8,8},{24,8}}, color={0,0,127}));
  annotation (
  experiment(StopTime=5.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/OpenBuildingControl/CDL/Logical/Validation/Switch.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Validation test for the block
<a href=\"modelica://Buildings.Experimental.OpenBuildingControl.CDL.Logical.Switch\">
Buildings.Experimental.OpenBuildingControl.CDL.Logical.Switch</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
April 2, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>

</html>"));
end Switch;
