within MslCases;
model CascodeCircuit_124
extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Semiconductors.J_NJFJFET 
                              J1(S(
                                 v(  start=0)), modelcard(CGS=0, CGD=0), AREA=1) 
    annotation (Placement(transformation(extent={{-54,38},{-34,58}})));
  Modelica.Electrical.Spice3.Semiconductors.J_NJFJFET 
                              J2(modelcard(CGS=0, CGD=0), AREA=1) 
    annotation (Placement(transformation(extent={{-54,4},{-34,24}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor RC(R=200, v(start=0)) 
    annotation (Placement(transformation(extent={{-44,60},{-24,80}})));
  Modelica.Electrical.Spice3.Basic.Ground ground 
    annotation (Placement(transformation(extent={{-54,-26},{-34,-6}})));
  Modelica.Electrical.Spice3.Sources.V_constant UDD(V=10) 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,60})));
  Modelica.Electrical.Spice3.Sources.V_constant U0(V=2) 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-72,38})));
  Modelica.Electrical.Spice3.Sources.V_sin v_sin(FREQ=10, VA=2) 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-66,4})));
equation
  connect(J2.D, J1.S) annotation (Line(
      points={{-44,24},{-44,38}}, color={0,0,255}));
  connect(ground.p, J2.S) annotation (Line(
      points={{-44,-6},{-44,4}}, color={0,0,255}));
  connect(v_sin.p, J2.G) annotation (Line(
      points={{-66,14},{-60,14},{-60,13.9},{-54,13.9}}, color={0,0,255}));
  connect(v_sin.n, ground.p) annotation (Line(
      points={{-66,-6},{-44,-6}}, color={0,0,255}));
  connect(U0.p, J1.G) annotation (Line(
      points={{-72,48},{-63,48},{-63,47.9},{-54,47.9}}, color={0,0,255}));
  connect(U0.n, ground.p) annotation (Line(
      points={{-72,28},{-80,28},{-80,-6},{-44,-6}}, color={0,0,255}));
  connect(J1.D, RC.p) annotation (Line(
      points={{-44,58},{-44,70}}, color={0,0,255}));
  connect(UDD.p, RC.n) annotation (Line(
      points={{-10,70},{-24,70}}, color={0,0,255}));
  connect(UDD.n, ground.p) annotation (Line(
      points={{-10,50},{-10,-6},{-44,-6}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>This model is a simple JFET cascode circuit. The J2 gate variation (v_sin.p.v) is transformed to the J2 drain variation (J2.D.v).</p>
<p><br>Simulate until 0.2s, and display the mentioned voltages.</p>
</html>", revisions="<html>
<ul>
<li><em>Aug. 2011</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"),experiment(
      StopTime=0.2,
      Interval=2e-4,
      Tolerance=1e-007));
end CascodeCircuit_124;
