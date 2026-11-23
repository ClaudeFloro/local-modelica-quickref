within MslCases;
model DryAir2_311 "Example 2 for dry air"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Utilities.PartialTestModel2(
      redeclare package Medium = Modelica.Media.Air.ReferenceAir.Air_pT);
  annotation (experiment(StopTime=1.01));
end DryAir2_311;
