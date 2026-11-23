within QuickRefExamples;
model RCCircuit "RC low-pass circuit charged by a voltage step"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Sources.StepVoltage source(V = 10, startTime = 0.1) 
    annotation(Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1000) 
    annotation(Placement(transformation(extent = {{-30, 20}, {-10, 40}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 1e-4, v(start = 0, fixed = true)) 
    annotation(Placement(transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground 
    annotation(Placement(transformation(extent = {{-30, -50}, {-10, -30}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor 
    annotation(Placement(transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
equation
  connect(source.p, resistor.p) 
    annotation(Line(points = {{-60, 10}, {-60, 30}, {-30, 30}}, color = {0, 0, 255}));
  connect(resistor.n, capacitor.p) 
    annotation(Line(points = {{-10, 30}, {20, 30}, {20, 10}}, color = {0, 0, 255}));
  connect(capacitor.n, ground.p) 
    annotation(Line(points = {{20, -10}, {20, -30}, {-20, -30}}, color = {0, 0, 255}));
  connect(source.n, ground.p) 
    annotation(Line(points = {{-60, -10}, {-60, -30}, {-20, -30}}, color = {0, 0, 255}));
  connect(voltageSensor.p, capacitor.p) 
    annotation(Line(points = {{50, 10}, {50, 30}, {20, 30}, {20, 10}}, color = {0, 0, 255}));
  connect(voltageSensor.n, capacitor.n) 
    annotation(Line(points = {{50, -10}, {50, -30}, {20, -30}, {20, -10}}, color = {0, 0, 255}));
  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6));
end RCCircuit;