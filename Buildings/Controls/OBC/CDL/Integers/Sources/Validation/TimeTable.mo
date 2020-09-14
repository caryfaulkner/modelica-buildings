within Buildings.Controls.OBC.CDL.Integers.Sources.Validation;
model TimeTable "Validation model for TimeTable block"

  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable timTabLin(
      table = [0,0; 6*3600,1; 18*3600,0.5; 24*3600,0])
    "Time table with smoothness method of linear segments"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable timTabLinHol(
      extrapolation = Buildings.Controls.OBC.CDL.Types.Extrapolation.HoldLastPoint,
      table = [0,0; 6*3600,1; 18*3600,0.5; 24*3600,0])
    "Time table with smoothness method of linear segments, hold first and last value"
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable timTabLinDer(
      extrapolation = Buildings.Controls.OBC.CDL.Types.Extrapolation.Periodic,
      table=[0,0; 6*3600,1; 18*3600,0.5; 24*3600,0])
    "Time table with smoothness method of linear segments, extrapolate with der"
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable timTabCon(
      table=[0,0; 6*3600,1; 18*3600,0.5; 24*3600,0])
    "Time table with smoothness method of constant segments"
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable timTabLinCon(
      table=[0,0; 6*3600,0; 6*3600,1; 18*3600,0.5; 24*3600,0])
    "Time table with smoothness method of linear segments"
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  annotation (experiment(Tolerance=1e-6, StopTime=172800),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/CDL/Integers/Sources/Validation/TimeTable.mos"
       "Simulate and plot"),
  Documentation(info="<html>
<p>
This model validates the TimeTable block. It takes as a parameter a time table of
the format
</p>
<pre>
table = [ 0*3600, 0;
          6*3600, 1;
         18*3600, 0.5;
         24*3600, 0];
</pre>
<p>
The block <code>timTabLin</code> applies smoothness method of linear segments
between table points, periodically repeat the table scope.
</p>
<p>
The block <code>timTabLinHol</code> applies smoothness method of linear segments
between table points, hold the last table points when it becomes outside of
table scope.
</p>
<p>
The block <code>timTabLinDer</code> applies smoothness method of linear segments
between table points, extrapolate by using the derivative at the last table
points to find points outside the table scope.
</p>
<p>
The block <code>timTabCon</code> applies smoothness method of constant segments
between table points, periodically repeat the table scope.
</p>
<p>
The block <code>timTabLinCon</code> applies smoothness method of linear segments
between table points, periodically repeat the table scope. Table points is
different so to ensure constant zero during time range of
<code>(0*3600, 6*36000)</code>.
</p>
<pre>
table = [ 0*3600, 0;
          6*3600, 0;
          6*3600, 1;
         18*3600, 0.5;
         24*3600, 0];
</pre>
</html>",
revisions="<html>
<ul>
<li>
September 14, 2020, by Milica Grahovac:<br/>
Initial CDL implementation.
</li>
</ul>
</html>"),
    Icon(graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent = {{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points = {{-36,60},{64,0},{-36,-60},{-36,60}})}));
end TimeTable;
