within MslCases;
model ElastoGap_295 "Demonstrate usage of ElastoGap"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.Fixed fixed 
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod1(L=2) 
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod2(L=2) 
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(
    c=10,
    s_rel0=1,
    s_rel(fixed=false, start=1),
    d=1.5) 
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(
    c=10,
    s_rel0=1,
    s_rel(fixed=false, start=1),
    d=1.5) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(
    s(fixed=true, start=2),
    L=0,
    m=1,
    v(fixed=true)) 
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGap1(
    c=10,
    s_rel(fixed=false, start=1.5),
    s_rel0=1.5,
    d=1.5) 
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGap2(
    c=10,
    s_rel(fixed=false, start=1.5),
    s_rel0=1.5,
    d=1.5) 
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(
    s(fixed=true, start=2),
    L=0,
    m=1,
    v(fixed=true)) 
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  parameter Modelica.Units.SI.TranslationalDampingConstant d=1.5 "Damping constant";
equation

  connect(rod1.flange_b, fixed.flange) annotation (Line(
      points={{-20,0},{0,0}}, color={0,127,0}));
  connect(fixed.flange, rod2.flange_a) annotation (Line(
      points={{0,0},{20,0}}, color={0,127,0}));
  connect(springDamper1.flange_a, rod1.flange_a) annotation (Line(
      points={{-40,30},{-50,30},{-50,0},{-40,0}}, color={0,127,0}));
  connect(springDamper2.flange_b, rod2.flange_b) annotation (Line(
      points={{40,30},{50,30},{50,0},{40,0}}, color={0,127,0}));
  connect(springDamper1.flange_b, mass1.flange_a) annotation (Line(
      points={{-20,30},{-10,30}}, color={0,127,0}));
  connect(mass1.flange_b, springDamper2.flange_a) annotation (Line(
      points={{10,30},{20,30}}, color={0,127,0}));
  connect(rod1.flange_a, elastoGap1.flange_a) annotation (Line(
      points={{-40,0},{-50,0},{-50,-30},{-40,-30}}, color={0,127,0}));
  connect(rod2.flange_b, elastoGap2.flange_b) annotation (Line(
      points={{40,0},{50,0},{50,-30},{40,-30}}, color={0,127,0}));
  connect(elastoGap1.flange_b, mass2.flange_a) annotation (Line(
      points={{-20,-30},{-10,-30}}, color={0,127,0}));
  connect(mass2.flange_b, elastoGap2.flange_a) annotation (Line(
      points={{10,-30},{20,-30}}, color={0,127,0}));
  annotation (
    experiment(StopTime=5, Interval=0.01),
    Documentation(info="<html>
<p>
This model demonstrates the effect of ElastoGaps on eigenfrequency:
Plot mass1.s and mass2.s as well as mass1.v and mass2.v to see that effect.
</p>
<p>
While mass1 is moved by both spring/damper forces all the time, this is not the case for mass2
since elastoGap1 lifts off at s&nbsp;&gt;&nbsp;-0.5 m and elastoGap2 lifts off at s&nbsp;&lt;&nbsp;+0.5 m.
Therefore, mass2 moves freely as long as -0.5&nbsp;m&nbsp;&lt;&nbsp;s&nbsp;&lt;&nbsp;+0.5&nbsp;m.
</p>
</html>"));
end ElastoGap_295;
