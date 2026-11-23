within MslCases;
model NRXFER_196 "Functionality test of NRXFERGATE"
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
  Modelica.Electrical.Digital.Tristates.NRXFERGATE nRXFERGATE(
                                      tHL=1, tLH=1) 
    annotation (Placement(transformation(extent={{-40,-54},{58,44}})));
equation
  connect(x_table.y, nRXFERGATE.x) annotation (Line(
      points={{-55,-10},{-45.05,-10},{-45.05,-9.9},{-35.1,-9.9}}, color={127,0,127}));
  connect(e_table.y, nRXFERGATE.enable) annotation (Line(
      points={{-55,40},{-35.1,40},{-35.1,29.3}}, color={127,0,127}));
  annotation (experiment(StopTime=12),
    Documentation(info="<html>
<p>This example is a simple test of the Tristates.NRXFER component.  After simulation until 12 s plot x, enable, and y of the <code>nRXFERGATE </code>component. To verify the result compare to the truth table <code>NRXferTable</code>.</p>
</html>"));
end NRXFER_196;
