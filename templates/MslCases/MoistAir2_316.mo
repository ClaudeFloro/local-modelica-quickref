within MslCases;
model MoistAir2_316 "Example 2 for moist air"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Utilities.PartialTestModel2(
      redeclare package Medium = Modelica.Media.Air.ReferenceMoistAir);
  annotation (experiment(StopTime=1.01));
end MoistAir2_316;
