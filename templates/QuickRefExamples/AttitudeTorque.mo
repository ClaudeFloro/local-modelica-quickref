within QuickRefExamples;
model AttitudeTorque "Constant yaw torque in body axes; yaw grows as 0.5*(tau/I_33)*t^2, pitch and roll stay 0"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Inertia Izz = 3500 "Yaw inertia";
  parameter Modelica.Units.SI.Torque tauYaw = 350 "Gives yaw acceleration 0.1 rad/s2";
  inner Modelica.Mechanics.MultiBody.World world(
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body aircraft(
    m = 1000, I_11 = 1000, I_22 = 3000, I_33 = Izz, r_CM = {0, 0, 0},
    r_0(start = {0, 0, 0}, each fixed = true), v_0(start = {0, 0, 0}, each fixed = true),
    angles_fixed = true, angles_start = {0, 0, 0}, sequence_start = {3, 2, 1},
    w_0_fixed = true, w_0_start = {0, 0, 0})
    annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant torqueCmd[3](k = {0, 0, tauYaw})
    "{roll, pitch, yaw} torque about body x, y, z"
    annotation(Placement(transformation(extent = {{-80, 30}, {-60, 50}})));
  Modelica.Mechanics.MultiBody.Forces.WorldTorque torque(
    resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)
    "frame_b: torque components are given in body axes"
    annotation(Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles eulerSensor(sequence = {3, 2, 1})
    "angles = {yaw, pitch, roll} in rad"
    annotation(Placement(transformation(extent = {{30, -10}, {50, 10}})));
equation
  connect(torqueCmd.y, torque.torque);
  connect(torque.frame_b, aircraft.frame_a);
  connect(aircraft.frame_a, eulerSensor.frame_a);
  annotation(experiment(StopTime = 2));
end AttitudeTorque;
