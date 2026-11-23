within MslCases;
model HalfAdder_193 "Adding circuit for binary numbers without input carry bit"
  import Modelica.Electrical.Digital;
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table a(
    t={1,2,3,4},
    x={L.'1',L.'0',L.'1',L.'0'},
    y0=L.'0') annotation (Placement(transformation(extent={{-80,18},{-60,38}})));
  Modelica.Electrical.Digital.Sources.Table b(
    x={L.'1',L.'0'},
    t={2,4},
    y0=L.'0') annotation (Placement(transformation(extent={{-80,-38},{-60,-18}})));
  Modelica.Electrical.Digital.Examples.Utilities.HalfAdder Adder(delayTime=0.3, AND(G2(
                                                                                y(       start=L.'U', fixed=true))),
XOR(G2(                                                                                                    y(       start=L.'U', fixed=true)))) 
                        annotation (Placement(transformation(extent={{-40,
            -40},{40,40}})));
  Modelica.Electrical.Digital.Converters.LogicToReal s(
n=1,
value_U=0.5,
value_X=0.5,
value_0=0,
value_1=1,
value_Z=0.5,
value_W=0.5,
value_L=0,
value_H=1,
value_m=0.5) annotation (Placement(transformation(extent={{60,
            18},{80,38}})));
  Modelica.Electrical.Digital.Converters.LogicToReal c(
n=1,
value_U=0.5,
value_X=0.5,
value_0=0,
value_1=1,
value_Z=0.5,
value_W=0.5,
value_L=0,
value_H=1,
value_m=0.5) annotation (Placement(transformation(extent={{60,
            -38},{80,-18}})));
equation
  connect(b.y,Adder. b) annotation (Line(
      points={{-60,-28},{-40,-28}}, color={127,0,127}));
  connect(a.y,Adder. a) annotation (Line(
      points={{-60,28},{-40,28}}, color={127,0,127}));
  connect(Adder.s, s.x[1]) annotation (Line(points={{40,28},{65,28}}, color={127,0,127}));
  connect(Adder.c, c.x[1]) annotation (Line(points={{40,-28},{65,-28}}, color={127,0,127}));
  annotation (
    Documentation(info="<html>
<p>
This example demonstrates an adding circuit for binary numbers, which internally realizes the interconnection to
And and to Xor in the final sum.</p>
<br>
<br>
1 + 0 = 1<br>
0 + 1 = 1<br>
1 + 1 = 10<br>
0 + 0 = 0
<br>
<br>
<strong>a</strong> + <strong>b</strong> = <strong>s</strong>
<br>(The carry of this adding is <strong>c</strong>.)
<br>
<br>and
<br>
<br>
<strong>a</strong> * <strong>b</strong> = <strong>s</strong>
<br>  (It is an interconnection to And.)
<br>
<br>
<strong>a</strong> * <strong>b</strong> + <strong>a</strong> * <strong>b</strong> = <strong>a</strong> Xor <strong>b</strong> = <strong>c</strong>
<br>(It is an interconnection to Xor.)
<br>
<blockquote><pre>
<strong>a</strong>     <strong>b</strong>     <strong>c</strong>      <strong>s</strong>     <strong>t</strong>

1     0     1      0     1
0     1     1      0     2
1     1     0      1     3
0     0     0      0     4
</pre></blockquote>
<p>
<strong>t</strong> is the pick-up instant of the next bit(s) in the simulation.
The simulation stop time should be 5 seconds.
</p>
</html>"),            experiment(StopTime=5));
end HalfAdder_193;
