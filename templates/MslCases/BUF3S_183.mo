within MslCases;
model BUF3S_183 "Functionality test of BUF3S"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;
  Modelica.Electrical.Digital.Sources.Table e_table(
y0=Modelica.Electrical.Digital.Interfaces.Logic.'U',
x={L.'0',L.'1',L.'Z'},
t={0,5,9}) 
    annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
  Modelica.Electrical.Digital.Sources.Table x_table(
y0=Modelica.Electrical.Digital.Interfaces.Logic.'U',
x={L.'1',L.'0'},
t={1,7}) 
    annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
  Modelica.Electrical.Digital.Tristates.BUF3S bUF3S(
    tHL=1,
    tLH=1,
    strength=Modelica.Electrical.Digital.Interfaces.Strength.'S_X01') 
    annotation (Placement(transformation(extent={{-40,-50},{48,38}})));
equation
  connect(x_table.y, bUF3S.x) annotation (Line(
      points={{-55,-10},{-35.6,-10.4}}, color={127,0,127}));
  connect(e_table.y, bUF3S.enable) annotation (Line(
      points={{-55,40},{-35.6,40},{-35.6,24.8}}, color={127,0,127}));
  annotation (experiment(StopTime=12),
    Documentation(info="<html>
<p>This example is a simple test of the Tristates.BUF3S component.  After simulation until 12 s plot x, enable, and y of the <code>bUF3S</code> component. To verify the result compare to the truth table Buf3sTable.</p>
</html>"));
end BUF3S_183;
