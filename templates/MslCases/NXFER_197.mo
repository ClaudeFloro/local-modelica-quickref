within MslCases;
model NXFER_197 "Functionality test of NXFERGATE"
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
  Modelica.Electrical.Digital.Tristates.NXFERGATE nXFERGATE(
                                    tHL=1, tLH=1) 
    annotation (Placement(transformation(extent={{-40,-52},{52,41}})));
equation

  connect(x_table.y, nXFERGATE.x) annotation (Line(
      points={{-55,-10},{-45.2,-10},{-45.2,-10.15},{-35.4,-10.15}}, color={127,0,127}));
  connect(e_table.y, nXFERGATE.enable) annotation (Line(
      points={{-55,40},{-35.4,40},{-35.4,27.05}}, color={127,0,127}));
  annotation (experiment(StopTime=12),
    Documentation(info="<html>
<p>This example is a simple test of the Tristates.NXFERGATE component.</p>
</html>"));
end NXFER_197;
