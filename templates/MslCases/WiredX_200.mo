within MslCases;
model WiredX_200 "Functionality test of WiredX"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;
Modelica.Electrical.Digital.Sources.Table e_table2(
y0=L.'U',
x={L.'0',L.'1',L.'0'},
t={0,3,9}) 
    annotation (Placement(transformation(extent={{-85,68},{-65,88}})));
  Modelica.Electrical.Digital.Sources.Table x_table2(
y0=L.'U',
x={L.'1',L.'0'},
t={1,7}) 
    annotation (Placement(transformation(extent={{-85,18},{-65,38}})));
  Modelica.Electrical.Digital.Tristates.BUF3S bUF3S2(
    tHL=1,
    tLH=1,
    strength=Modelica.Electrical.Digital.Interfaces.Strength.'S_X01') 
    annotation (Placement(transformation(extent={{-48,-1},{16,63}})));
  Modelica.Electrical.Digital.Sources.Table e_table1(
y0=L.'U',
t={0,3,9},
x={L.'0',L.'1',L.'0'}) 
    annotation (Placement(transformation(extent={{-85,-24},{-65,-4}})));
  Modelica.Electrical.Digital.Sources.Table x_table1(
y0=L.'U',
x={L.'0',L.'1',L.'0'},
t={1,5,7}) 
    annotation (Placement(transformation(extent={{-85,-74},{-65,-54}})));
  Modelica.Electrical.Digital.Tristates.BUF3S bUF3S1(
    tHL=1,
    tLH=1,
    strength=Modelica.Electrical.Digital.Interfaces.Strength.'S_X01') 
    annotation (Placement(transformation(extent={{-52,-94},{14,-28}})));
  Modelica.Electrical.Digital.Tristates.WiredX wiredX(n=2) 
    annotation (Placement(transformation(extent={{26,-38},{80,16}})));
equation
  connect(x_table2.y, bUF3S2.x) annotation (Line(
      points={{-65,28},{-44.8,27.8}}, color={127,0,127}));
  connect(e_table2.y, bUF3S2.enable) annotation (Line(
      points={{-65,78},{-44.8,78},{-44.8,53.4}}, color={127,0,127}));
  connect(x_table1.y, bUF3S1.x) annotation (Line(
      points={{-65,-64},{-48.7,-64.3}}, color={127,0,127}));
  connect(e_table1.y, bUF3S1.enable) annotation (Line(
      points={{-65,-14},{-48.7,-14},{-48.7,-37.9}}, color={127,0,127}));
  connect(bUF3S1.y, wiredX.x[1]) annotation (Line(
      points={{10.7,-64.3},{24,-64.3},{24,-21.8},{36.8,-21.8}}, color={127,0,127}));
  connect(bUF3S2.y, wiredX.x[2]) annotation (Line(
      points={{12.8,27.8},{26,27.8},{26,-0.2},{36.8,-0.2}}, color={127,0,127}));
  annotation (experiment(StopTime=12),
    Documentation(info="<html>
<p>This example is a simple test of the Tristates.WiredX component. The input width is set to two. After simulation until 12 s plot x[1], x[2], and y of the WiredX component. To verify the result compare to the truth table  Tables.ResolutionTable.</p>
</html>"));
end WiredX_200;
