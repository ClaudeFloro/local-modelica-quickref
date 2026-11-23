within MslCases;
model R134a2_309 "Example 2 for R134a"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Utilities.PartialTestModel2(
    redeclare package Medium = Modelica.Media.R134a.R134a_ph,
    h_start=107390,
    fixedMassFlowRate(use_T_ambient=false),
    volume(use_T_start=false),
    ambient(use_T_ambient=false));
  annotation (experiment(StopTime=1.01));
end R134a2_309;
