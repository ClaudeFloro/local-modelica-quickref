within MslCases;
model MoistAir1_315 "Example 1 for moist air"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Utilities.PartialTestModel(
      redeclare package Medium = Modelica.Media.Air.ReferenceMoistAir);
  annotation (experiment(StopTime=1.01));
end MoistAir1_315;
