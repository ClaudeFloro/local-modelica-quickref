within MslCases;
model InvertersApartRecord_128
  "Two inverters where transistor models use different modelcard instances"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Basic.Ground ground annotation (Placement(transformation(extent={{-38,-80},
            {-18,-60}})));
//--------------------------------------------------------------------------------------------------------------
/*apart record: For each transistor in the circuit a record with the technology parameters is made available
as an instance of the record modelcardMOS */
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardMOS MPmos(GAMMA=0.37, CBD=0, CBS=0)
    "Specified modelcardMOS for MPmos"; //instance of record modelcardMOS
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardMOS MNmos(GAMMA=0.37, LAMBDA=0.02, CBD=0, CBS=0)
    "Specified modelcardMOS for MNmos";
                                         //instance of record modelcardMOS
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp1(modelcard=MPmos, IC=-1e40) 
            annotation (Placement(transformation(extent={{-38,20},{-18,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn1(modelcard=MNmos, IC=-1e40) 
            annotation (Placement(transformation(extent={{-38,-30},{-18,-10}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp2(modelcard=MPmos, IC=-1e40) 
            annotation (Placement(transformation(extent={{2,20},{22,40}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn2(modelcard=MNmos, IC=-1e40) 
            annotation (Placement(transformation(extent={{2,-30},{22,-10}})));
//--------------------------------------------------------------------------------------------------------------

  Modelica.Electrical.Spice3.Basic.C_Capacitor c1(C=1e-5,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={-8,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Basic.C_Capacitor c2(C=1e-5,
    IC=0,
    UIC=true) 
    annotation (Placement(transformation(
        origin={34,-30},
        extent={{-10,-10},{10,10}},
        rotation=270)));

  Modelica.Electrical.Spice3.Sources.V_pulse vin(
    V2=5,
    TD=2,
    TR=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-32})));
  Modelica.Electrical.Spice3.Sources.V_pulse v(V2=5, TR=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-32})));
equation
  connect(mp1.B, mp1.D) annotation (Line(points={{-18,30},{-18,40},{-28,
          40}}, color={0,0,255}));
  connect(mn1.S, ground.p) 
    annotation (Line(points={{-28,-30},{-28,-60}}, color={0,0,255}));
  connect(mp1.S, mn1.D) 
    annotation (Line(points={{-28,20},{-28,-10}}, color={0,0,255}));
  connect(mn1.G, mp1.G) annotation (Line(points={{-38,-20.1},{-38,29.9}}, color={0,0,255}));
  connect(mn1.B, mn1.S) annotation (Line(points={{-18,-20},{-18,-30},{-28,
          -30}}, color={0,0,255}));
  connect(mp2.B, mp2.D) annotation (Line(points={{22,30},{22,40},{12,40}}, color={0,0,255}));
  connect(mn2.S, ground.p) annotation (Line(points={{12,-30},{12,-60},{-28,
          -60}}, color={0,0,255}));
  connect(mp2.S, mn2.D) 
    annotation (Line(points={{12,20},{12,-10}}, color={0,0,255}));
  connect(mn2.G, mp2.G) annotation (Line(points={{2,-20.1},{2,29.9}}, color={0,0,255}));
  connect(mn2.B, mn2.S) annotation (Line(points={{22,-20},{22,-30},{12,
          -30}}, color={0,0,255}));
  connect(mp2.G, mn1.D) annotation (Line(points={{2,29.9},{2,0},{-28,0},{
          -28,-10}}, color={0,0,255}));
  connect(c1.p, mn1.D) annotation (Line(points={{-8,-20},{-8,0},{-28,0},{
          -28,-10}}, color={0,0,255}));
  connect(mn2.D, c2.p) annotation (Line(points={{12,-10},{12,0},{34,0},{34,
          -20}}, color={0,0,255}));
  connect(c2.n, ground.p) annotation (Line(points={{34,-40},{34,-60},{-28,
          -60}}, color={0,0,255}));
  connect(c1.n, ground.p) annotation (Line(points={{-8,-40},{-8,-60},{-28,
          -60}}, color={0,0,255}));
  connect(mp1.G, vin.p) annotation (Line(
      points={{-38,29.9},{-60,29.9},{-60,-22}}, color={0,0,255}));
  connect(vin.n, ground.p) annotation (Line(points={{-60,-42},{-60,-60},{-28,
          -60}}, color={0,0,255}));
  connect(v.p, mp2.D) annotation (Line(
      points={{60,-22},{60,40},{12,40}}, color={0,0,255}));
  connect(mp1.D, mp2.D) annotation (Line(
      points={{-28,40},{12,40}}, color={0,0,255}));
  connect(v.n, ground.p) annotation (Line(points={{60,-42},{60,-60},{-28,-60}},
        color={0,0,255}));
  annotation (experiment(StopTime=5),
    Documentation(info="<html>
<p>An inverter is an electrical circuit that consists of a PMOS and a NMOS. Its task is to turn the input voltage from high potential to low potential or the other way round. This circuit <em>InverterApartModel</em> contains two inverters. The input voltage of the first inverter is nearly equal to the output voltage of the second inverter. Capacities cause some differences.</p>
<p>To see the typical behavior of the circuit the input voltages and the output voltages should be plotted. Besides that it can be interesting to watch the output voltage of the first inverter. Simulated until t=5s.</p>
<p>Input voltages: vin.p.v and v.p.v</p>
<p>Output voltage of the first inverter: mn1.D.v</p>
<p>Output voltage of the second Inverter: mn2.D.v</p>
<p>This example shows one possibility to make the record of the technology parameters available for more than one transistor. For each transistor in the circuit a record with the technology parameters is made available as an instance of the record modelcardMOS. In this circuit we need two different records for technology parameters, one for PMOS (MPmos) and one for NMOS (MNmos). This instances of the record for the technology parameters were made available for every transistor as one of theirs parameters (Spice3.Repository.MOS mn1(mtype=0, modelcard=MNmos).</p>
</html>", revisions="<html>
<ul>
<li><em>April 2009</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"));
end InvertersApartRecord_128;
