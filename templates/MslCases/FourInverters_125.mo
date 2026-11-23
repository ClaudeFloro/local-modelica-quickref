within MslCases;
model FourInverters_125
  "Four inverters with MOSFET level 1, using private record as model card"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Basic.Ground ground annotation (Placement(transformation(extent={{-74,-80},
            {-54,-60}})));

  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardMOS modp(CBD=0, CBS=0)
    "Private PMOS modelcard";
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardMOS modn(CBD=0, CBS=0)
    "Private NMOS modelcard";

  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp1(modelcard=modp, IC=-1e40) 
            annotation (Placement(transformation(extent={{-74,20},{-54,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn1(modelcard=modn, IC=-1e40) 
            annotation (Placement(transformation(extent={{-74,-30},{-54,-10}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp2(modelcard=modp, IC=-1e40) 
            annotation (Placement(transformation(extent={{-34,20},{-14,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn2(modelcard=modn, IC=-1e40) 
            annotation (Placement(transformation(extent={{-34,-30},{-14,-10}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp3(modelcard=modp, IC=-1e40) 
            annotation (Placement(transformation(extent={{6,20},{26,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn3(modelcard=modp, IC=-1e40) 
            annotation (Placement(transformation(extent={{6,-30},{26,-10}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp4(modelcard=modn, IC=-1e40) 
            annotation (Placement(transformation(extent={{46,20},{66,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn4(modelcard=modn, IC=-1e40) 
            annotation (Placement(transformation(extent={{46,-30},{66,-10}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c1(C=10e-6,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={-44,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c2(C=10e-6,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={-2,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c3(C=10e-6,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={36,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c4(C=10e-6,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={76,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Sources.V_pulse vin(
    V2=5,
    TD=2,
    TR=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-86,-42})));
  Modelica.Electrical.Spice3.Sources.V_pulse v(V2=5, TR=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={92,-48})));
equation
  connect(mp1.B, mp1.D) annotation (Line(points={{-54,30},{-54,40},{-64,
          40}}, color={0,0,255}));
  connect(mn1.S, ground.p) 
    annotation (Line(points={{-64,-30},{-64,-60}}, color={0,0,255}));
  connect(mp1.S, mn1.D) 
    annotation (Line(points={{-64,20},{-64,-10}}, color={0,0,255}));
  connect(mn1.G, mp1.G) annotation (Line(points={{-74,-20.1},{-74,29.9}}, color={0,0,255}));
  connect(mn1.B, mn1.S) annotation (Line(points={{-54,-20},{-54,-30},{-64,
          -30}}, color={0,0,255}));
  connect(mp2.B, mp2.D) annotation (Line(points={{-14,30},{-14,40},{-24,
          40}}, color={0,0,255}));
  connect(mn2.S, ground.p) annotation (Line(points={{-24,-30},{-24,-60},{
          -64,-60}}, color={0,0,255}));
  connect(mp2.S, mn2.D) 
    annotation (Line(points={{-24,20},{-24,-10}}, color={0,0,255}));
  connect(mn2.G, mp2.G) annotation (Line(points={{-34,-20.1},{-34,29.9}}, color={0,0,255}));
  connect(mn2.B, mn2.S) annotation (Line(points={{-14,-20},{-14,-30},{-24,
          -30}}, color={0,0,255}));
  connect(c1.p, mn1.D) annotation (Line(points={{-44,-20},{-44,0},{-64,0},
          {-64,-10}}, color={0,0,255}));
  connect(mn2.D, c2.p) annotation (Line(points={{-24,-10},{-24,0},{-2,0},{
          -2,-20}}, color={0,0,255}));
  connect(c2.n, ground.p) annotation (Line(points={{-2,-40},{-2,-60},{-64,
          -60}}, color={0,0,255}));
  connect(c1.n, ground.p) annotation (Line(points={{-44,-40},{-44,-60},{-64,
          -60}}, color={0,0,255}));
  connect(c3.n, ground.p) annotation (Line(points={{36,-40},{36,-60},{-64,
          -60}}, color={0,0,255}));
  connect(c4.n, ground.p) annotation (Line(points={{76,-40},{76,-60},{-64,
          -60}}, color={0,0,255}));
  connect(mn4.B, mn4.S) annotation (Line(points={{66,-20},{66,-30},{56,
          -30}}, color={0,0,255}));
  connect(mn3.B, mn3.S) annotation (Line(points={{26,-20},{26,-30},{16,
          -30}}, color={0,0,255}));
  connect(mp3.B, mp3.D) annotation (Line(points={{26,30},{26,40},{16,40}}, color={0,0,255}));
  connect(mp4.B, mp4.D) annotation (Line(points={{66,30},{66,40},{56,40}}, color={0,0,255}));
  connect(mp3.S, mn3.D) 
    annotation (Line(points={{16,20},{16,-10}}, color={0,0,255}));
  connect(mp4.S, mn4.D) 
    annotation (Line(points={{56,20},{56,-10}}, color={0,0,255}));
  connect(mn3.S, ground.p) annotation (Line(points={{16,-30},{16,-60},{-64,
          -60}}, color={0,0,255}));
  connect(mn4.S, ground.p) annotation (Line(points={{56,-30},{56,-60},{-64,
          -60}}, color={0,0,255}));
  connect(c3.p, mn3.D) annotation (Line(points={{36,-20},{36,0},{16,0},{16,
          -10}}, color={0,0,255}));
  connect(c4.p, mn4.D) annotation (Line(points={{76,-20},{76,0},{56,0},{56,
          -10}}, color={0,0,255}));
  connect(c2.p, mn3.G) annotation (Line(points={{-2,-20},{2,-20},{2,-20.1},
          {6,-20.1}}, color={0,0,255}));
  connect(mn3.G, mp3.G) annotation (Line(points={{6,-20.1},{6,29.9}}, color={0,0,255}));
  connect(c3.p, mn4.G) annotation (Line(points={{36,-20},{41,-20},{41,
          -20.1},{46,-20.1}}, color={0,0,255}));
  connect(mn4.G, mp4.G) annotation (Line(points={{46,-20.1},{46,29.9}}, color={0,0,255}));
  connect(c1.p, mn2.G) annotation (Line(points={{-44,-20},{-39,-20},{-39,
          -20.1},{-34,-20.1}}, color={0,0,255}));
  connect(vin.p, mn1.G) annotation (Line(
      points={{-86,-32},{-86,0},{-74,0},{-74,-20.1}}, color={0,0,255}));
  connect(vin.n, ground.p) annotation (Line(points={{-86,-52},{-86,-60},{-64,
          -60}}, color={0,0,255}));
  connect(v.p, mp4.D) annotation (Line(
      points={{92,-38},{92,40},{56,40}}, color={0,0,255}));
  connect(v.n, ground.p) annotation (Line(points={{92,-58},{92,-60},{-64,-60}},
        color={0,0,255}));
  connect(mp3.D, mp4.D) annotation (Line(
      points={{16,40},{56,40}}, color={0,0,255}));
  connect(mp2.D, mp3.D) annotation (Line(
      points={{-24,40},{16,40}}, color={0,0,255}));
  connect(mp1.D, mp2.D) annotation (Line(
      points={{-64,40},{-24,40}}, color={0,0,255}));
  annotation (experiment(StopTime=5),
    Documentation(info="<html>
<p>This circuit that contains four inverter was designed to show the functionality of the MOS transistor models. To see the behavior of the circuit the output voltages of each inverter should be displayed (mp1.S.v, mp2.S.v, mp3.S.v, mp4.S.v). The output voltages of the second an fourth inverter and the input voltage of the first inverter have the same potential. The output voltages of the first and third inverter have the opposite potential compared with inverter 2 and 4.</p>
<p>Simulate until t=5s. The output values should be: mp1.S.v, mp2.S.v, mp3.S.v and mp4.S.v</p>
</html>", revisions="<html>
<ul>
<li><em>April 2009</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"));
end FourInverters_125;
