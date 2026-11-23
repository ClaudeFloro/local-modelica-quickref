within MslCases;
model Nor_131 "MOS NOR gate circuit"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp1(modelcard(
      RD=1e-4,
      RS=1e-4,
      CBD=1e-5,
      CBS=1e-5,
      CGSO=1e-5,
      CGDO=1e-5,
      CGBO=1e-5), Dinternal(start=0,fixed=true), Sinternal(start=0,fixed=true), IC=-1e40) annotation (Placement(transformation(
          extent={{-16,24},{4,44}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp2(modelcard(
      RD=1e-4,
      RS=1e-4,
      CBD=1e-5,
      CBS=1e-5,
      CGSO=1e-5,
      CGDO=1e-5,
      CGBO=1e-5), Dinternal(start=0,fixed=true), Sinternal(start=0,fixed=true), IC=-1e40) annotation (Placement(transformation(
          extent={{-16,-6},{4,14}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn1(modelcard(
      RD=1e-4,
      RS=1e-4,
      CBD=1e-5,
      CBS=1e-5,
      CGSO=1e-5,
      CGDO=1e-5,
      CGBO=1e-5), Dinternal(start=0,fixed=true), Sinternal(start=0,fixed=true), IC=-1e40) annotation (Placement(transformation(
          extent={{-16,-44},{4,-24}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn2(modelcard(
      RD=1e-4,
      RS=1e-4,
      CBD=1e-5,
      CBS=1e-5,
      CGSO=1e-5,
      CGDO=1e-5,
      CGBO=1e-5), Dinternal(start=0,fixed=true), Sinternal(start=0,fixed=true), IC=-1e40) annotation (Placement(transformation(
          extent={{32,-44},{52,-24}})));
  Modelica.Electrical.Spice3.Basic.Ground ground annotation (Placement(transformation(extent={{28,-100},
            {48,-80}})));
  Modelica.Electrical.Spice3.Sources.V_pulse vin1(
    V2=5,
    TR=0.001,
    TF=0.001,
    PW=2,
    PER=10,
    TD=2) annotation (Placement(transformation(
        origin={-42,24},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Sources.V_pulse vin2(
    V2=5,
    TR=0.001,
    TF=0.001,
    PW=2,
    PER=10,
    TD=1) annotation (Placement(transformation(
        origin={-44,-44},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Sources.V_pulse v(
    TD=0.5,
    TR=0.1,
    V2=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={62,34})));
equation
  connect(mn1.B, mn1.S) annotation (Line(points={{4,-34},{4,-44},{
          -6,-44}}, color={0,0,255}));
  connect(mn2.B, mn2.S) annotation (Line(points={{52,-34},{52,-44},
          {42,-44}}, color={0,0,255}));
  connect(mn2.S, ground.p) annotation (Line(points={{42,-44},{38,-44},
          {38,-80}}, color={0,0,255}));
  connect(mn1.S, ground.p) annotation (Line(points={{-6,-44},{-6,-80},{
          38,-80}}, color={0,0,255}));
  connect(vin2.p, mn1.G) annotation (Line(points={{-44,-34},{-29,
          -34},{-29,-34.1},{-16,-34.1}}, color={0,0,255}));
  connect(vin2.n, ground.p) annotation (Line(points={{-44,-54},{-44,-80},
          {38,-80}}, color={0,0,255}));
  connect(vin1.p, mp1.G) annotation (Line(points={{-42,34},{-29,34},
          {-29,33.9},{-16,33.9}}, color={0,0,255}));
  connect(vin1.n, ground.p) annotation (Line(points={{-42,14},{-64,14},{
          -64,-80},{38,-80}}, color={0,0,255}));
  connect(mp1.S, mp2.D) 
    annotation (Line(points={{-6,24},{-6,14}}, color={0,0,255}));
  connect(mp2.S, mn1.D) annotation (Line(points={{-6,-6},{-6,-24}}, color={0,0,255}));
  connect(mn2.D, mn1.D) annotation (Line(points={{42,-24},{-6,-24}}, color={0,0,255}));
  connect(vin2.p, mp2.G) annotation (Line(points={{-44,-34},{-44,4},
          {-16,4},{-16,3.9}}, color={0,0,255}));
  connect(vin1.p, mn2.G) annotation (Line(points={{-42,34},{-28,34},
          {-28,-18},{32,-18},{32,-34.1}}, color={0,0,255}));
  connect(mp1.B, mp1.D) annotation (Line(
      points={{4,34},{4,44},{-6,44}}, color={0,0,255}));
  connect(mp2.B, mp1.B) annotation (Line(
      points={{4,4},{4,34}}, color={0,0,255}));
  connect(v.p, mp1.D) annotation (Line(
      points={{62,44},{-6,44}}, color={0,0,255}));
  connect(v.n, ground.p) annotation (Line(points={{62,24},{62,-80},{38,-80}},
        color={0,0,255}));
  annotation (Documentation(info="<html>
<p>In nearly every electronic the basic circuit &quot;nor&quot; is used. A nor contains two PMOS and two NMOS. The faulty wiring can be seen in the graphical mode. If and only if the two input voltages have low potential, the output voltage has high potential, otherwise the output voltage has low potential.</p>
<p>Nor truth table (1 means true, it is represented by the 5V voltage):</p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>input voltage vin1</p></td>
<td><p>input voltage vin2</p></td>
<td><p>output voltage mp1.S</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
</table>
<p>Simulate until t=5s. Display the two input voltages vin1.p.v and vin2.p.v and the output voltage mp1.S.v.</p>
<p>The output value in the example shows a behaviour &quot;near&quot; the one of the truth table, since the capacitances are huge. Therefore loading is not finished before the next input changes.</p>
</html>", revisions="<html>
<ul>
<li><em>March 2009</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"),
    experiment(StopTime=5));
end Nor_131;
