within QuickRefExamples;
model MassSpringDamper "1-DOF translational mass-spring-damper driven by a sine force"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Mass m = 1 "Mass";
  parameter Modelica.Units.SI.TranslationalSpringConstant c = 100 "Spring stiffness";
  parameter Modelica.Units.SI.TranslationalDampingConstant d = 2 "Damping coefficient";
  Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) 
    annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = c, d = d, s_rel0 = 0) 
    annotation(Placement(transformation(extent = {{-50, -10}, {-30, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = m, L = 0,
    s(start = 0.05, fixed = true), v(start = 0, fixed = true)) 
    annotation(Placement(transformation(extent = {{0, -10}, {20, 10}})));
  Modelica.Mechanics.Translational.Sources.Force force 
    annotation(Placement(transformation(extent = {{60, -10}, {40, 10}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10, f = 0.5) 
    annotation(Placement(transformation(extent = {{100, -10}, {80, 10}})));
equation
  connect(fixed.flange, springDamper.flange_a) 
    annotation(Line(points = {{-80, 0}, {-50, 0}}, color = {0, 127, 0}));
  connect(springDamper.flange_b, mass.flange_a) 
    annotation(Line(points = {{-30, 0}, {0, 0}}, color = {0, 127, 0}));
  connect(force.flange, mass.flange_b) 
    annotation(Line(points = {{40, 0}, {20, 0}}, color = {0, 127, 0}));
  connect(sine.y, force.f) 
    annotation(Line(points = {{79, 0}, {62, 0}}, color = {0, 0, 127}));
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6));
end MassSpringDamper;