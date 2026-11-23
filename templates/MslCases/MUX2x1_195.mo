within MslCases;
model MUX2x1_195 "Simple Multiplexer test"
  import D = Modelica.Electrical.Digital;
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;
  D.Multiplexers.MUX2x1 Mux2x1 
    annotation (Placement(transformation(extent={{-34,-48},{56,48}})));
  D.Sources.Table Input1(
    y0=L.'U',
    x={L.'X',L.'0',L.'1',L.'0',L.'X',L.'U'},
    t={2,4,6,8,10,12}) 
    annotation (Placement(transformation(extent={{-90,14},{-70,34}})));
  D.Sources.Step Select(
    before=L.'0',
    after=L.'1',
    stepTime=7) 
    annotation (Placement(transformation(extent={{-90,58},{-70,78}})));
  D.Sources.Table Input0(
    y0=L.'U',
    t={2,4,6,8,10,12},
    x={L.'1',L.'X',L.'0',L.'X',L.'1',L.'U'}) 
    annotation (Placement(transformation(extent={{-90,-34},{-70,-14}})));
equation
  connect(Select.y, Mux2x1.sel) annotation (Line(
      points={{-70,68},{11,68},{11,43.2}}, color={127,0,127}));
  connect(Input0.y, Mux2x1.in0) annotation (Line(
      points={{-70,-24},{-29.5,-24}}, color={127,0,127}));
  connect(Input1.y, Mux2x1.in1) annotation (Line(
      points={{-70,24},{-29.5,24}}, color={127,0,127}));
  annotation (experiment(StopTime=15),
    Documentation(info="<html>
<p>This example is a simple test of a single multiplexer component with 2 inputs prescribed by sources, one select input, and one output. After simulation until 15 s plot Mux2x1.in0, Mux2x1.in1, Mux2x1.sel, and Mux2x1.out. Compare the output signal with the input signals. If the select signal changes, the output switches to the other input.</p>
</html>"));
end MUX2x1_195;
