within MslCases;
model DFFREGSRH_186 "Pulse triggered D-Register-Bank, high active set and reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table clock(x={L.'0',L.'1',L.'0'}, t={0,10,11}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'W'}, t={0}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(x={L.'0',L.'1',L.'0'}, t={0,1,2}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(x={L.'0'}, t={0}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Sources.Table set(x={L.'0',L.'1',L.'0'}, t={0,5,6}) 
    annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
  Modelica.Electrical.Digital.Registers.DFFREGSRH dFFREGSRH(
    tHL=2,
    tLH=3,
    n=2) 
    annotation (Placement(transformation(extent={{-34,-37},{73,71}})));
equation

  connect(clock.y, dFFREGSRH.clock) annotation (Line(
      points={{-66,-22},{-50,-22},{-50,6.2},{-29.72,6.2}}, color={127,0,127}));
  connect(set.y, dFFREGSRH.set) annotation (Line(
      points={{-66,84},{-48,84},{-48,60.2},{-29.72,60.2}}, color={127,0,127}));
  connect(reset.y, dFFREGSRH.reset) annotation (Line(
      points={{-66,-60},{-29.72,-60},{-29.72,-15.4}}, color={127,0,127}));
  connect(data_0.y, dFFREGSRH.dataIn[1]) annotation (Line(
      points={{-66,18},{-48,18},{-48,36.44},{-29.72,36.44}}, color={127,0,127}));
  connect(data_1.y, dFFREGSRH.dataIn[2]) annotation (Line(
      points={{-66,50},{-48,50},{-48,40.76},{-29.72,40.76}}, color={127,0,127}));
  annotation (experiment(StopTime=15),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGSRH component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DFFREGSRH component.</p>
</html>"));
end DFFREGSRH_186;
