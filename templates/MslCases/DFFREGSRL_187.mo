within MslCases;
model DFFREGSRL_187 "Pulse triggered D-Register-Bank, low active set and reset"
import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table clock(x={L.'0',L.'1',L.'0'}, t={0,10,11}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'W'}, t={0}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(t={0,1,2}, x={L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(x={L.'0'}, t={0}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Sources.Table set(t={0,5,6}, x={L.'1',L.'0',L.'1'}) 
    annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
  Modelica.Electrical.Digital.Registers.DFFREGSRL dFFREGSRL(
    tHL=2,
    tLH=3,
    n=2) annotation (Placement(transformation(extent={{-45,-54},{81,72}})));
equation
  connect(reset.y, dFFREGSRL.reset) annotation (Line(
      points={{-66,-60},{-39.96,-60},{-39.96,-28.8}}, color={127,0,127}));
  connect(clock.y, dFFREGSRL.clock) annotation (Line(
      points={{-66,-22},{-56,-22},{-56,-3.6},{-39.96,-3.6}}, color={127,0,127}));
  connect(set.y, dFFREGSRL.set) annotation (Line(
      points={{-66,84},{-39.96,84},{-39.96,59.4}}, color={127,0,127}));
  connect(data_0.y, dFFREGSRL.dataIn[1]) annotation (Line(
      points={{-66,18},{-56,18},{-56,31.68},{-39.96,31.68}}, color={127,0,127}));
  connect(data_1.y, dFFREGSRL.dataIn[2]) annotation (Line(
      points={{-66,50},{-56,50},{-56,36.72},{-39.96,36.72}}, color={127,0,127}));
  annotation (experiment(StopTime=15),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGSRL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DFFREGSRL component.</p>
</html>"));
end DFFREGSRL_187;
