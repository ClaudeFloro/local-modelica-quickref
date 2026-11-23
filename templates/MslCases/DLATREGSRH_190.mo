within MslCases;
model DLATREGSRH_190 "Level sensitive D-Register-Bank, high active set and reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table enable(x={L.'0',L.'1',L.'0'}, t={0,10,18}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={0,15}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(x={L.'0',L.'1',L.'0',L.'1',L.'0'}, t={0,1,2,20,21}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={0,16}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Sources.Table set(x={L.'0',L.'1',L.'0'}, t={0,5,6}) 
    annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
  Modelica.Electrical.Digital.Registers.DLATREGSRH dLATREGSRH(
    tHL=2,
    tLH=3,
    n=2, delay(inertialDelaySensitive(each y(start=L.'U', fixed=true)))) annotation (Placement(transformation(extent={{-45,-42},{69,71}})));
equation

  connect(reset.y, dLATREGSRH.reset) annotation (Line(
      points={{-66,-60},{-40.44,-60},{-40.44,-19.4}}, color={127,0,127}));
  connect(enable.y, dLATREGSRH.enable) annotation (Line(
      points={{-66,-22},{-52,-22},{-52,3.2},{-40.44,3.2}}, color={127,0,127}));
  connect(data_0.y, dLATREGSRH.dataIn[1]) annotation (Line(
      points={{-66,18},{-52,18},{-52,34.84},{-40.44,34.84}}, color={127,0,127}));
  connect(data_1.y, dLATREGSRH.dataIn[2]) annotation (Line(
      points={{-66,50},{-52,50},{-52,39.36},{-40.44,39.36}}, color={127,0,127}));
  connect(set.y, dLATREGSRH.set) annotation (Line(
      points={{-66,84},{-40.44,84},{-40.44,59.7}}, color={127,0,127}));

  annotation (experiment(StopTime=25),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGSRH component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DLATREGSRH component.</p>
</html>"));
end DLATREGSRH_190;
