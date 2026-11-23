within MslCases;
model CoupledInductors_202
  extends Modelica.Icons.Example;
  Modelica.Electrical.Spice3.Basic.Ground ground 
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Electrical.Spice3.Sources.V_sin sineVoltage(VA=220, FREQ=50) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,20})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R1(R=1) 
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Electrical.Spice3.Basic.L_Inductor L1(L=1, UIC=false) 
                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,40})));
  Modelica.Electrical.Spice3.Basic.L_Inductor L2(L=0.01) 
                          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,60})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R2(R=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,80})));
  Modelica.Electrical.Spice3.Basic.K_CoupledInductors k1(k=0.1) 
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R3(R=1000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,50})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C1(
    C=1e-6,
    IC=0,
    UIC=true) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,50})));
  Modelica.Electrical.Spice3.Basic.L_Inductor L3(L=0.01) 
                          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,-40})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R4(R=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,-20})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R5(R=1000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-50})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C2(
    C=2.e-3,
    IC=0,
    UIC=true) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-50})));
  Modelica.Electrical.Spice3.Basic.K_CoupledInductors k2(k=0.05) 
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Electrical.Spice3.Basic.K_CoupledInductors k3(k=0.05) 
                              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,10})));
equation
  connect(sineVoltage.n, ground.p) annotation (Line(
      points={{-90,10},{-90,-80}}, color={0,0,255}));
  connect(R1.p, sineVoltage.p) annotation (Line(
      points={{-80,80},{-90,80},{-90,30}}, color={0,0,255}));
  connect(R1.n, L1.p) annotation (Line(
      points={{-60,80},{-40,80},{-40,50}}, color={0,0,255}));
  connect(L1.n, ground.p) annotation (Line(
      points={{-40,30},{-40,-80},{-90,-80}}, color={0,0,255}));
  connect(C1.n, R3.n) annotation (Line(
      points={{80,40},{60,40}}, color={0,0,255}));
  connect(L2.n, R3.n) annotation (Line(
      points={{20,50},{20,40},{60,40}}, color={0,0,255}));
  connect(C1.p, R2.p) annotation (Line(
      points={{80,60},{80,80},{52,80}}, color={0,0,255}));
  connect(R3.p, R2.p) annotation (Line(
      points={{60,60},{60,80},{52,80}}, color={0,0,255}));
  connect(R2.n, L2.p) annotation (Line(
      points={{32,80},{20,80},{20,70}}, color={0,0,255}));
  connect(C2.n, R5.n) annotation (Line(
      points={{80,-60},{60,-60}}, color={0,0,255}));
  connect(L3.n, R5.n) annotation (Line(
      points={{20,-50},{20,-60},{60,-60}}, color={0,0,255}));
  connect(C2.p, R4.p) annotation (Line(
      points={{80,-40},{80,-20},{52,-20}}, color={0,0,255}));
  connect(R5.p, R4.p) annotation (Line(
      points={{60,-40},{60,-20},{52,-20}}, color={0,0,255}));
  connect(R4.n, L3.p) annotation (Line(
      points={{32,-20},{20,-20},{20,-30}}, color={0,0,255}));
  connect(C1.n, ground.p) annotation (Line(
      points={{80,40},{90,40},{90,-80},{-90,-80}}, color={0,0,255}));
  connect(C2.n, ground.p) annotation (Line(
      points={{80,-60},{90,-60},{90,-80},{-90,-80}}, color={0,0,255}));
  connect(L1.ICP, k2.inductiveCouplePin1) annotation (Line(
      points={{-31.6,40},{-28,40},{-28,-40},{-20,-40}}, color={170,85,255}));
  connect(k2.inductiveCouplePin2, L3.ICP) annotation (Line(
      points={{0,-40},{11.6,-40}}, color={170,85,255}));
  connect(L3.ICP, k3.inductiveCouplePin1) annotation (Line(
      points={{11.6,-40},{6,-40},{6,0}}, color={170,85,255}));
  connect(k3.inductiveCouplePin2, L2.ICP) annotation (Line(
      points={{6,20},{6,60},{11.6,60}}, color={170,85,255}));
  connect(L2.ICP, k1.inductiveCouplePin2) annotation (Line(
      points={{11.6,60},{0,60}}, color={170,85,255}));
  connect(L1.ICP, k1.inductiveCouplePin1) annotation (Line(
      points={{-31.6,40},{-28,40},{-28,60},{-20,60}}, color={170,85,255}));
  annotation (
    experiment(StopTime=0.2),
    Documentation(info="<html>
<p>The coupled inductor circuit demonstrates how different inductors can be coupled using the Component K_CoupledInductors from package Basic</p>
<p>Simulate until 0.2s, and display the behaviour of the parts that are coupled via <code>K</code>, such as <code>C1.p.v</code>, and <code>C2.p.v</code>.</p>
</html>"));
end CoupledInductors_202;
