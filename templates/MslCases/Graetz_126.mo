within MslCases;
model Graetz_126 "Graetz rectifier circuit"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D1(IC=-1e40, SENS_AREA=false,modelcarddiode(CJO=1e-7),pin(start=0, fixed=true)) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={0,14})));
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D3(IC=-1e40, SENS_AREA=false,modelcarddiode(CJO=1e-7), n(v(start=0, fixed=true))) 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-8})));
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D4(IC=-1e40, SENS_AREA=false,modelcarddiode(CJO=1e-7)) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={1,-30})));
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D2(IC=-1e40, SENS_AREA=false,modelcarddiode(CJO=1e-7)) 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-8})));
  Modelica.Electrical.Spice3.Semiconductors.R_Resistor rout(R=10) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,-7})));
  Modelica.Electrical.Spice3.Sources.V_sin vsin(VA=10, FREQ=200) 
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-44,-8})));
  Modelica.Electrical.Spice3.Basic.Ground ground 
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
equation
  connect(D1.n, D3.p) annotation (Line(points={{10,14},{20,14},{20,2}},
        color={0,0,255}));
  connect(D2.p, D1.p) annotation (Line(
      points={{-20,2},{-20,14},{-10,14}}, color={0,0,255}));
  connect(D4.n, D3.n) annotation (Line(points={{11,-30},{20,-30},{20,-18}},
        color={0,0,255}));
  connect(D4.p, D2.n) annotation (Line(
      points={{-9,-30},{-20,-30},{-20,-18}}, color={0,0,255}));
  connect(D4.p, ground.p) annotation (Line(
      points={{-9,-30},{-20,-30},{-20,-40}}, color={0,0,255}));
  connect(vsin.n, ground.p) annotation (Line(points={{-44,-18},{-44,-40},{-20,
          -40}}, color={0,0,255}));
  connect(D4.n, rout.p) annotation (Line(points={{11,-30},{42,-30},{42,-17}},
        color={0,0,255}));
  connect(rout.n, D1.p) annotation (Line(
      points={{42,3},{42,26},{-20,26},{-20,14},{-10,14}}, color={0,0,255}));
  connect(D3.p, vsin.p) annotation (Line(
      points={{20,2},{20,40},{-44,40},{-44,2}}, color={0,0,255}));
  annotation (
    experiment(StopTime=0.025),
    Documentation(info="<html>
<p>The Graetz rectifier circuit is to show the behaviour of diodes.</p>
<p>Simulator until 0.025 s. Then display the input voltage vsin.p.v. The rout.p.v voltage is the rectified voltage result, which is pulsing mostly in the positive range.</p>
</html>", revisions="<html>
<ul>
<li><em>Jan. 2010</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"));
end Graetz_126;
