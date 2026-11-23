within MslCases;
model Oscillator_203 "Oscillator circuit"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Basic.R_Resistor r(R=1000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-36,20})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c(
    C=1e-7,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c1(
    C=1e-7,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(extent={{24,0},{44,20}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor r1(R=22000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-6,20})));
  Modelica.Electrical.Spice3.Basic.R_Resistor r2(R=22000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,20})));
  Modelica.Electrical.Spice3.Basic.R_Resistor r3(R=1000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,20})));
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT T1(modelcard(CJE=1e-9, CJC=1e-9), vbe(start=0, fixed=true)) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,-24})));
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT T2(modelcard(CJE=1e-9, CJC=1e-9), vbe(start=0, fixed=true)) 
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  Modelica.Electrical.Spice3.Basic.Ground ground1 
    annotation (Placement(transformation(extent={{-78,-34},{-58,-14}})));
  Modelica.Electrical.Spice3.Basic.Ground ground2 
    annotation (Placement(transformation(extent={{50,-60},{70,-40}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor r4(R=10000) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={64,-2})));
  Modelica.Electrical.Spice3.Sources.V_pulse v(
    V2=8,
    TD=0.0005,
    TR=0.01,
    PW=1000,
    PER=1000,
    TF=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,20})));

equation
  connect(r.n, r1.n) annotation (Line(
      points={{-36,30},{-6,30}}, color={0,0,255}));
  connect(r1.n, r2.n) annotation (Line(
      points={{-6,30},{18,30}}, color={0,0,255}));
  connect(r2.n, r3.n) annotation (Line(
      points={{18,30},{50,30}}, color={0,0,255}));
  connect(r.p, c.p) annotation (Line(
      points={{-36,10},{-32,10}}, color={0,0,255}));
  connect(c.n, r1.p) annotation (Line(
      points={{-12,10},{-6,10}}, color={0,0,255}));
  connect(r2.p, c1.p) annotation (Line(
      points={{18,10},{24,10}}, color={0,0,255}));
  connect(c1.n, r3.p) annotation (Line(
      points={{44,10},{50,10}}, color={0,0,255}));
  connect(r1.p, T2.B) annotation (Line(
      points={{-6,10},{-6,-30},{30.4,-30}}, color={0,0,255}));
  connect(r2.p, T1.B) annotation (Line(
      points={{18,10},{18,-24},{-20.4,-24}}, color={0,0,255}));
  connect(T1.C, r.p) annotation (Line(
      points={{-33,-34},{-48,-34},{-48,10},{-36,10}}, color={0,0,255}));
  connect(T1.E, ground1.p) annotation (Line(
      points={{-33,-14},{-68,-14}}, color={0,0,255}));
  connect(T2.E, ground2.p) annotation (Line(
      points={{43,-40},{60,-40}}, color={0,0,255}));
  connect(r3.p, T2.C) annotation (Line(
      points={{50,10},{50,-20},{43,-20}}, color={0,0,255}));
  connect(r3.p, r4.p) annotation (Line(
      points={{50,10},{58,10},{58,8},{64,8}}, color={0,0,255}));
  connect(ground2.p, r4.n) annotation (Line(
      points={{60,-40},{60,-12},{64,-12}}, color={0,0,255}));
  connect(v.p, r.n) annotation (Line(
      points={{-68,30},{-36,30}}, color={0,0,255}));
  connect(v.n, ground1.p) annotation (Line(
      points={{-68,10},{-68,-14}}, color={0,0,255}));
  annotation (
    experiment(StopTime=0.025),
    Documentation(info="<html>
<p>The oscillator circuit demonstrates the usage of BJT transistors.</p>
<p>Simulate until 0.025 s. Display v.p.v, which is rising until 5 V. Furthermore display r4.p.v, which starts oscillating.</p>
</html>", revisions="<html>
<ul>
<li><em>Jan. 2010</em> by Jonathan Gerbet initially implemented</li>
</ul>
</html>"));
end Oscillator_203;
