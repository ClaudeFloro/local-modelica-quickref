within MslCases;
model DFFREG_184 "Pulse triggered D-Register-Bank, high active reset"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Sources.Table clock(x={L.'0',L.'1',L.'0',L.'1',L.'0',L.'1',L.'0'}, t={0,7,8,10,11,15,16}) 
    annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
  Modelica.Electrical.Digital.Sources.Table data_0(x={L.'1',L.'0'}, t={0,12}) 
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Electrical.Digital.Sources.Table reset(x={L.'0',L.'1',L.'0'}, t={0,1,2}) 
    annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
  Modelica.Electrical.Digital.Sources.Table data_1(t={0,10}, x={L.'H',L.'X'}) 
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Modelica.Electrical.Digital.Registers.DFFREG dFFREG(
    n=2,
    tHL=5,
    tLH=6,
    delay( inertialDelaySensitive(each y(start=L.'U', fixed=true))),
dFFR(                                                            clock(     start=L.'U', fixed=true), reset(     start=L.'U',fixed=true))) 
    annotation (Placement(transformation(extent={{-24,-26},{70,68}})));

equation
  connect(clock.y, dFFREG.clock) annotation (Line(
      points={{-66,-22},{-46,-22},{-46,11.6},{-20.24,11.6}}, color={127,0,127}));
  connect(reset.y, dFFREG.reset) annotation (Line(
      points={{-66,-60},{-20.24,-60},{-20.24,-7.2}}, color={127,0,127}));
  connect(data_0.y, dFFREG.dataIn[1]) annotation (Line(
      points={{-66,18},{-44,18},{-44,37.92},{-20.24,37.92}}, color={127,0,127}));
  connect(data_1.y, dFFREG.dataIn[2]) annotation (Line(
      points={{-66,50},{-44,50},{-44,41.68},{-20.24,41.68}}, color={127,0,127}));
  annotation (experiment(StopTime=25),
Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREG component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the truth table which is documented in the DFFREG component.</p>
</html>"));
end DFFREG_184;
