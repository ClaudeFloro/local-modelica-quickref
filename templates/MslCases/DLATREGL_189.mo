within MslCases;
model DLATREGL_189 "Level sensitive D-Register-Bank, low active reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table enable(x={L.'0',L.'1',L.'0'}, t={0,10,18}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={0,15}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(t={0,1,2,20,21}, x={L.'1',L.'0',L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={0,16}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Registers.DLATREGL dLATREGL(
    tHL=2,
    tLH=3,
    n=2, delay(inertialDelaySensitive(each y(start=L.'U', fixed=true)))) annotation (Placement(transformation(extent={{-45,-50},{84,79}})));
equation

  connect(reset.y, dLATREGL.reset) annotation (Line(
      points={{-66,-60},{-39.84,-60},{-39.84,-24.2}}, color={127,0,127}));
  connect(enable.y, dLATREGL.enable) annotation (Line(
      points={{-66,-22},{-54,-22},{-54,1.6},{-39.84,1.6}}, color={127,0,127}));
  connect(data_0.y, dLATREGL.dataIn[1]) annotation (Line(
      points={{-66,18},{-56,18},{-56,37.72},{-39.84,37.72}}, color={127,0,127}));
  connect(data_1.y, dLATREGL.dataIn[2]) annotation (Line(
      points={{-66,50},{-56,50},{-56,42.88},{-39.84,42.88}}, color={127,0,127}));
  annotation (experiment(StopTime=25),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DLATREGL component.</p>
</html>"));
end DLATREGL_189;
