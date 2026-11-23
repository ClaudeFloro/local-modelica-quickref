within MslCases;
model DryAir1_310 "Example 1 for dry air"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Utilities.PartialTestModel(
      redeclare package Medium = Modelica.Media.Air.ReferenceAir.Air_pT);
  annotation (experiment(StopTime=1.01));
end DryAir1_310;
