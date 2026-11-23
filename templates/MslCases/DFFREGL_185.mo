within MslCases;
model DFFREGL_185 "Pulse triggered D-Register-Bank, low active reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table clock(x={L.'0',L.'1',L.'0',L.'1',L.'0',L.'1',L.'0'}, t={0,7,8,10,11,15,16}) 
    annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'1',L.'0'}, t={0,12}) 
    annotation (Placement(transformation(extent={{-88,10},{-68,30}})));
  Modelica.Electrical.Digital.Sources.Table reset(t={0,1,2}, x={L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(t={0,10}, x={L.'H',L.'X'}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Registers.DFFREGL dFFREGL(
    n=2,
    tHL=5,
    tLH=6,delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))),
dFFR(                                                                 clock(     start=L.'U', fixed=true), reset(     start=L.'U', fixed=true))) 
    annotation (Placement(transformation(extent={{-41,-39},{62,65}})));
equation

  connect(reset.y, dFFREGL.reset) annotation (Line(
      points={{-66,-60},{-36.88,-60},{-36.88,-18.2}}, color={127,0,127}));
  connect(clock.y, dFFREGL.clock) annotation (Line(
      points={{-66,-20},{-62,-20},{-62,2.6},{-36.88,2.6}}, color={127,0,127}));
  connect(data_0.y, dFFREGL.dataIn[1]) annotation (Line(
      points={{-68,20},{-52,20},{-52,31.72},{-36.88,31.72}}, color={127,0,127}));
  connect(data_1.y, dFFREGL.dataIn[2]) annotation (Line(
      points={{-66,50},{-52,50},{-52,35.88},{-36.88,35.88}}, color={127,0,127}));
  annotation (experiment(StopTime=25),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DFFREGL component.</p>
</html>"));
end DFFREGL_185;
