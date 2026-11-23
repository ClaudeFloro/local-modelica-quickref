within MslCases;
model Nand_130 "MOS Nand gate circuit"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp1(
    L=2e-5,
    W=1e-5,
    modelcard(PHI=0.7, CBD=0, CBS=0), Sinternal(start=0), IC=-1e40) annotation (Placement(transformation(
          extent={{-22,24},{-2,44}})));
  Modelica.Electrical.Spice3.Semiconductors.M_PMOS mp2(modelcard(PHI=0.7,CBD=0, CBS=0), IC=-1e40) 
                                       annotation (Placement(transformation(
          extent={{24,24},{44,44}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn2(Dinternal(start=0), modelcard(CBD=0, CBS=0), IC=-1e40) annotation (Placement(transformation(
          extent={{-24,-44},{-4,-24}})));
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS mn1(modelcard(CBD=0, CBS=0), IC=-1e40) annotation (Placement(transformation(
          extent={{-24,-10},{-4,10}})));
  Modelica.Electrical.Spice3.Sources.V_constant vconstant(V=5) annotation (Placement(
        transformation(extent={{-10,-10},{10,10}},
                                                 rotation=270,
        origin={62,34})));
  Modelica.Electrical.Spice3.Basic.Ground ground annotation (Placement(transformation(extent={{20,-100},
            {40,-80}})));
  Modelica.Electrical.Spice3.Sources.V_pulse vin1(
    TR=1e-9,
    TF=1e-9,
    V2=5,
    TD=2e-8,
    PW=4e-8,
    PER=8e-8) annotation (Placement(transformation(
        origin={-50,24},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Spice3.Sources.V_pulse vin2(
    V2=5,
    TR=1e-9,
    TF=1e-9,
    TD=1e-8,
    PW=4e-8,
    PER=8e-8) annotation (Placement(transformation(
        origin={-52,-44},
        extent={{-10,-10},{10,10}},
        rotation=270)));

equation
  connect(mp1.B, mp1.D) annotation (Line(points={{-2,34},{-2,44},{
          -12,44}}, color={0,0,255}));
  connect(mp2.B, mp2.D) annotation (Line(points={{44,34},{44,44},
          {34,44}}, color={0,0,255}));
  connect(vconstant.p, mp2.D) annotation (Line(points={{62,44},{62,44},
          {34,44}}, color={0,0,255}));
  connect(mp2.D, mp1.D) 
    annotation (Line(points={{34,44},{-12,44}}, color={0,0,255}));
  connect(mp1.G, mn1.G) annotation (Line(points={{-22,33.9},{-22,
          16},{-24,16},{-24,-0.1}}, color={0,0,255}));
  connect(mp1.G, vin1.p) annotation (Line(points={{-22,33.9},{-38,33.9},
          {-38,34},{-50,34}}, color={0,0,255}));
  connect(vin1.n, ground.p) annotation (Line(points={{-50,14},{-62,14},{
          -62,-80},{30,-80}}, color={0,0,255}));
  connect(mp2.G, mn2.G) annotation (Line(points={{24,33.9},{24,14},
          {-32,14},{-32,-34.1},{-24,-34.1}}, color={0,0,255}));
  connect(mn2.G, vin2.p) annotation (Line(points={{-24,-34.1},{-38,
          -34.1},{-38,-34},{-52,-34}}, color={0,0,255}));
  connect(vin2.n, ground.p) annotation (Line(points={{-52,-54},{-52,-80},{
          30,-80}}, color={0,0,255}));
  connect(mn2.S, ground.p) annotation (Line(points={{-14,-44},{-14,-80},
          {30,-80}}, color={0,0,255}));
  connect(mn1.B, mn2.B) 
    annotation (Line(points={{-4,0},{-4,-34}}, color={0,0,255}));
  connect(mn2.B, mn2.S) annotation (Line(points={{-4,-34},{-4,-44},
          {-14,-44}}, color={0,0,255}));
  connect(mn1.S, mn2.D) 
    annotation (Line(points={{-14,-10},{-14,-24}}, color={0,0,255}));
  connect(mp1.S, mn1.D) 
    annotation (Line(points={{-12,24},{-12,18},{-14,18},{-14,10}}, color={0,0,255}));
  connect(mp2.S, mn1.D) annotation (Line(points={{34,24},{34,10},
          {-14,10}}, color={0,0,255}));
  connect(vconstant.n, ground.p) annotation (Line(points={{62,24},{62,-80},
          {30,-80}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>In nearly every electronic the basic circuit &quot;nand&quot; are used. A nand contains two PMOS and two NMOS. The faulty wiring can be seen in the graphical mode. If and only if the two input voltages have high potential, the output voltage has low potential, otherwise the output voltage has high potential.</p>
<p>Nand truth table (1 means true, it is represented by the 5V voltage):</p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>input voltage vin1</p></td>
<td><p>input voltage vin2</p></td>
<td><p>output voltage mn1.D</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
</table>
<p>Simulate until t=2e-7s. Display the two input voltages vin1.p.v and vin2.p.v and the output voltage mn1.D.v, which becomes zero only if both input values are high.</p>
</html>", revisions="<html>
<ul>
<li><em>May 2009</em> by Kristin Majetta initially implemented</li>
</ul>
</html>"),
    experiment(StopTime=2e-007));
end Nand_130;
