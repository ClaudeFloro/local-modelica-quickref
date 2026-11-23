within MslCases;
model VectorDelay_199 "Vector delay"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Delay.InertialDelaySensitiveVector delay(
    final tHL=1,
    final tLH=2,
    final n=3, inertialDelaySensitive(each y(start=L.'U', fixed=true))) 
    annotation (Placement(transformation(extent={{-36,-28},{40,48}})));
  Modelica.Electrical.Digital.Sources.Table table(x={L.'0',L.'1',L.'0', L.'1', L.'0'}, t={0,1,5,7,8}) 
    annotation (Placement(transformation(extent={{-96,40},{-76,60}})));
  Modelica.Electrical.Digital.Sources.Table table1(x={L.'0',L.'1'}, t={0,1}) 
    annotation (Placement(transformation(extent={{-96,0},{-76,20}})));
  Modelica.Electrical.Digital.Sources.Table table2(x={L.'0', L.'1', L.'0'}, t={0,1,6}) 
    annotation (Placement(transformation(extent={{-96,-50},{-76,-30}})));
equation

  connect(table.y, delay.x[1]) annotation (Line(
      points={{-76,50},{-30.68,50},{-30.68,6.13667}}, color={127,0,127}));
  connect(table1.y, delay.x[2]) annotation (Line(
      points={{-76,10},{-30.68,10},{-30.68,9.81}}, color={127,0,127}));
  connect(table2.y, delay.x[3]) annotation (Line(
      points={{-76,-40},{-30.68,-40},{-30.68,13.4833}}, color={127,0,127}));
  annotation (Documentation(info="<html>
<p>This example is a simple test of the vector valued sensitive delay component. The delay times are chosen different from each other. To examine the results plot both the input vector x and the output vector y.</p>
</html>"),
experiment(StopTime=10));
end VectorDelay_199;
