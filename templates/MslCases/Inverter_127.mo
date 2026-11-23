within MslCases;
model Inverter_127 "Simple inverter circuit"
//--------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp(modelcard(
      RD=0,
      RS=0,
      CBD=0,
      CBS=0), Sinternal(start=0),IC=-1e40) 
    annotation (Placement(transformation(extent={{-14,8},{6,28}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn(modelcard(
      RD=0,
      RS=0,
      CBD=0,
      CBS=0), IC=-1e40) 
    annotation (Placement(transformation(extent={{-14,-34},{6,-14}})));
  Modelica.Electrical.Spice3.Basic.Ground ground 
    annotation (Placement(transformation(extent={{-14,-60},{6,-40}})));
  Modelica.Electrical.Spice3.Sources.V_pulse vin(
    V2=5,
    TD=4e-12,
    TR=0.1e-12,
    TF=0.1e-12,
    PW=1e-12,
    PER=2e-12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-16})));
  Modelica.Electrical.Spice3.Sources.V_pulse v(V2=5, TR=0.1e-12) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-4})));
equation
  connect(mn.D, mp.S) annotation (Line(
      points={{-4,-14},{-4,8}}, color={0,0,255}));
  connect(mp.G, mn.G) annotation (Line(
      points={{-14,17.9},{-14,-24.1}}, color={0,0,255}));
  connect(mn.S, mn.B) annotation (Line(
      points={{-4,-34},{6,-34},{6,-24}}));
  connect(mp.B, mp.D) annotation (Line(
      points={{6,18},{6,28},{-4,28}}, color={0,0,255}));
  connect(mn.S, ground.p) annotation (Line(
      points={{-4,-34},{-4,-40}}));
  connect(v.p, mp.D) annotation (Line(
      points={{40,6},{40,28},{-4,28}}, color={0,0,255}));
  connect(v.n, ground.p) annotation (Line(points={{40,-14},{40,-40},{-4,-40}},
        color={0,0,255}));
  connect(vin.p, mp.G) annotation (Line(
      points={{-40,-6},{-40,17.9},{-14,17.9}}, color={0,0,255}));
  connect(vin.n, ground.p) annotation (Line(points={{-40,-26},{-40,-40},{-4,
          -40}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1e-11,
      Interval=5e-15,
      Tolerance=1e-7),
    Documentation(info="<html>
<p>An inverter is an electrical circuit that consists of a PMOS and a NMOS transistor. Its task is to turn the input voltage from high potential to low potential or the other way round.</p>
<p>Simulate until 1e-11 s. Display the input voltage vin.p.v as well as the output voltage mp.S.v. It shows that the input voltage is inverted.</p>
</html>", revisions="<html>
<ul>
<li><em>March 2009</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"));
end Inverter_127;
