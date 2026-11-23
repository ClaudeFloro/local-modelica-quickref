within QuickRefExamples;
model DCMotorSpeedPID "Closed-loop speed control: PI controller drives a DC motor to a speed setpoint"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step setpoint(height = 100, startTime = 0.1) "Speed reference in rad/s"
    annotation(Placement(transformation(extent = {{-110, 40}, {-90, 60}})));
  Modelica.Blocks.Continuous.LimPID controller(
    controllerType = Modelica.Blocks.Types.SimpleController.PI,
    k = 0.5, Ti = 0.05, yMax = 24, yMin = -24) "Output is armature voltage in V"
    annotation(Placement(transformation(extent = {{-70, 40}, {-50, 60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage voltage
    annotation(Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor armatureR(R = 0.5)
    annotation(Placement(transformation(extent = {{-20, 20}, {0, 40}})));
  Modelica.Electrical.Analog.Basic.Inductor armatureL(L = 0.01, i(start = 0, fixed = true))
    annotation(Placement(transformation(extent = {{10, 20}, {30, 40}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf(k = 0.05) "k > 0: positive current gives positive torque"
    annotation(Placement(transformation(extent = {{30, -10}, {50, 10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation(Placement(transformation(extent = {{-10, -50}, {10, -30}})));
  Modelica.Mechanics.Rotational.Components.Inertia rotor(J = 1e-3,
    phi(start = 0, fixed = true), w(start = 0, fixed = true))
    annotation(Placement(transformation(extent = {{60, -10}, {80, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper friction(d = 1e-3)
    annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation(Placement(transformation(extent = {{110, -30}, {130, -10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation(Placement(transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(setpoint.y, controller.u_s)
    annotation(Line(points = {{-89, 50}, {-72, 50}}, color = {0, 0, 127}));
  connect(speedSensor.w, controller.u_m)
    annotation(Line(points = {{70, 61}, {70, 70}, {-60, 70}, {-60, 38}}, color = {0, 0, 127}));
  connect(controller.y, voltage.v)
    annotation(Line(points = {{-49, 50}, {-42, 50}, {-42, 0}}, color = {0, 0, 127}));
  connect(voltage.p, armatureR.p)
    annotation(Line(points = {{-30, 10}, {-30, 30}, {-20, 30}}, color = {0, 0, 255}));
  connect(armatureR.n, armatureL.p)
    annotation(Line(points = {{0, 30}, {10, 30}}, color = {0, 0, 255}));
  connect(armatureL.n, emf.p)
    annotation(Line(points = {{30, 30}, {40, 30}, {40, 10}}, color = {0, 0, 255}));
  connect(emf.n, ground.p)
    annotation(Line(points = {{40, -10}, {40, -30}, {0, -30}}, color = {0, 0, 255}));
  connect(voltage.n, ground.p)
    annotation(Line(points = {{-30, -10}, {-30, -30}, {0, -30}}, color = {0, 0, 255}));
  connect(emf.flange, rotor.flange_a)
    annotation(Line(points = {{50, 0}, {60, 0}}));
  connect(rotor.flange_b, friction.flange_a)
    annotation(Line(points = {{80, 0}, {90, 0}}));
  connect(friction.flange_b, fixed.flange)
    annotation(Line(points = {{110, 0}, {120, 0}, {120, -20}}));
  connect(speedSensor.flange, rotor.flange_b)
    annotation(Line(points = {{70, 40}, {70, 20}, {84, 20}, {84, 0}, {80, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6));
end DCMotorSpeedPID;
