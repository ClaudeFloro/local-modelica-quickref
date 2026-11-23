within QuickRefExamples;
model DCMotor "Permanent-magnet DC motor driving an inertia with viscous load"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Sources.StepVoltage source(V = 12, startTime = 0.1) 
    annotation(Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor armatureR(R = 0.5) 
    annotation(Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  Modelica.Electrical.Analog.Basic.Inductor armatureL(L = 0.01, i(start = 0, fixed = true)) 
    annotation(Placement(transformation(extent = {{-30, 20}, {-10, 40}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf(k = 0.05) 
    annotation(Placement(transformation(extent = {{0, -10}, {20, 10}})));
  Modelica.Electrical.Analog.Basic.Ground ground 
    annotation(Placement(transformation(extent = {{-50, -50}, {-30, -30}})));
  Modelica.Mechanics.Rotational.Components.Inertia rotor(J = 1e-3,
    phi(start = 0, fixed = true), w(start = 0, fixed = true)) 
    annotation(Placement(transformation(extent = {{40, -10}, {60, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper friction(d = 1e-3) 
    annotation(Placement(transformation(extent = {{70, -10}, {90, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed 
    annotation(Placement(transformation(extent = {{90, -30}, {110, -10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor 
    annotation(Placement(transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(source.p, armatureR.p) 
    annotation(Line(points = {{-80, 10}, {-80, 30}, {-60, 30}}, color = {0, 0, 255}));
  connect(armatureR.n, armatureL.p) 
    annotation(Line(points = {{-40, 30}, {-30, 30}}, color = {0, 0, 255}));
  connect(armatureL.n, emf.p) 
    annotation(Line(points = {{-10, 30}, {10, 30}, {10, 10}}, color = {0, 0, 255}));
  connect(emf.n, ground.p) 
    annotation(Line(points = {{10, -10}, {10, -30}, {-40, -30}}, color = {0, 0, 255}));
  connect(source.n, ground.p) 
    annotation(Line(points = {{-80, -10}, {-80, -30}, {-40, -30}}, color = {0, 0, 255}));
  connect(emf.flange, rotor.flange_a) 
    annotation(Line(points = {{20, 0}, {40, 0}}));
  connect(rotor.flange_b, friction.flange_a) 
    annotation(Line(points = {{60, 0}, {70, 0}}));
  connect(friction.flange_b, fixed.flange) 
    annotation(Line(points = {{90, 0}, {100, 0}, {100, -20}}));
  connect(speedSensor.flange, rotor.flange_b) 
    annotation(Line(points = {{50, 30}, {50, 20}, {64, 20}, {64, 0}, {60, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6));
end DCMotor;