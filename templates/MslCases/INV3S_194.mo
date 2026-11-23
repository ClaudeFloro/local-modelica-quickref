within MslCases;
model INV3S_194 "Functionality test of INV3S"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table e_table(
y0=L.'U',
x={L.'0',L.'1',L.'Z'},
t={0,5,9}) 
    annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
  Modelica.Electrical.Digital.Sources.Table x_table(
y0=L.'U',
x={L.'1',L.'0'},
t={1,7}) 
    annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
  Modelica.Electrical.Digital.Tristates.INV3S iNV3S 
    annotation (Placement(transformation(extent={{-34,-44},{42,32}})));
equation
  connect(x_table.y, iNV3S.x) annotation (Line(
      points={{-55,-10},{-42.6,-10},{-42.6,-9.8},{-30.2,-9.8}}, color={127,0,127}));
  connect(e_table.y, iNV3S.enable) annotation (Line(
      points={{-55,40},{-30.2,40},{-30.2,20.6}}, color={127,0,127}));
  annotation (experiment(StopTime=12),
    Documentation(info="<html>
<p>This example is a simple test of the Tristates.INV3S component. After simulation until 12 s plot x, enable, and y of the <code>iNV3S</code> component. To verify the result compare to the truth table <code>T.UX01Table</code>.</p>
</html>"));
end INV3S_194;
