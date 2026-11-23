within MslCases;
model DLATREGSRL_191 "Level sensitive D-Register-Bank, low active set and reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table enable(t={0,10,18}, x={L.'0',L.'1',L.'0'}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={0,15}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(t={0,1,2,20,21}, x={L.'1',L.'0',L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={0,16}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Sources.Table set(t={0,5,6}, x={L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
  Modelica.Electrical.Digital.Registers.DLATREGSRL dLATREGSRL(
    tHL=2,
    tLH=3,
    n=2, delay(inertialDelaySensitive(each y(start=L.'U',fixed=true)))) annotation (Placement(transformation(extent={{-45,-43},{69,71}})));
equation

  connect(reset.y, dLATREGSRL.reset) annotation (Line(
      points={{-66,-60},{-40.44,-60},{-40.44,-20.2}}, color={127,0,127}));
  connect(enable.y, dLATREGSRL.enable) annotation (Line(
      points={{-66,-22},{-56,-22},{-56,2.6},{-40.44,2.6}}, color={127,0,127}));
  connect(data_0.y, dLATREGSRL.dataIn[1]) annotation (Line(
      points={{-66,18},{-56,18},{-56,34.52},{-40.44,34.52}}, color={127,0,127}));
  connect(data_1.y, dLATREGSRL.dataIn[2]) annotation (Line(
      points={{-66,50},{-56,50},{-56,39.08},{-40.44,39.08}}, color={127,0,127}));
  connect(set.y, dLATREGSRL.set) annotation (Line(
      points={{-66,84},{-40.44,84},{-40.44,59.6}}, color={127,0,127}));
  annotation (experiment(StopTime=25),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGSRL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DLATREGSRL component.</p>
</html>"));
end DLATREGSRL_191;
