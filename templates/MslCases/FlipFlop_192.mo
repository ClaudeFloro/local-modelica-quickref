within MslCases;
model FlipFlop_192 "Pulse Triggered Master Slave Flip-Flop"
  import D = Modelica.Electrical.Digital;
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  D.Examples.Utilities.JKFF FF 
                 annotation (Placement(transformation(extent={{-10,-40},{70,
            40}})));
  D.Sources.DigitalClock CLK(period=10, startTime=0, width=50) annotation (Placement(transformation(
          extent={{-80,-10},{-60,10}})));
  D.Sources.Table J(
    y0=L.'0',
    x={L.'1',L.'0',L.'1',L.'0'},
    t={50,100,145,200}) annotation (Placement(transformation(extent={{-80,
            18},{-60,38}})));
  D.Sources.Table K(
    y0=L.'0',
    x={L.'1',L.'0',L.'1',L.'0'},
    t={22,140,150,180}) annotation (Placement(transformation(extent={{-80,
            -38},{-60,-18}})));
equation
  connect(J.y, FF.j) annotation (Line(
      points={{-60,28},{-10,28}}, color={127,0,127}));
  connect(CLK.y, FF.clk) annotation (Line(
      points={{-60,0},{-10,0}}, color={127,0,127}));
  connect(K.y, FF.k) annotation (Line(
      points={{-60,-28},{-10,-28}}, color={127,0,127}));
  annotation (
    Documentation(info="<html>
<p>A pulse-triggered master-slave flip-flop is demonstrated. The flipflop component is composed by basic gates. It can be found in the Utilities subpackage. The example is designed to test and demonstrate the basic gate components.</p>
</html>"),            experiment(StopTime=250));
end FlipFlop_192;
