within MslCases;
model CompareSincExpSine_0 "Compare sinc and exponential sine signal"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sinc sinc(f=5) 
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Sources.ExpSine expSine1(f=5, damping=5) 
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Blocks.Sources.ExpSine expSine2(
    f=5,
    phase=Modelica.Constants.pi/2,
    damping=5) 
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  annotation (experiment(StopTime=1.0, Interval=0.0001), Documentation(info="<html>
<p>
Compare the sinc signal and an exponentially damped sine.
</p>
</html>"));
end CompareSincExpSine_0;
