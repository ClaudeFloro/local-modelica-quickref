within QuickRefExamples;
model AttitudeInit "Free rigid body (aircraft) with initial yaw/pitch/roll; sensor reads the Euler angles back"
  extends Modelica.Icons.Example;
  // Aerospace Euler angles: rotate world -> body about z (yaw), then y (pitch), then x (roll).
  // In MSL this is sequence {3,2,1} with angles {yaw, pitch, roll}.
  parameter Modelica.Units.SI.Angle yaw0 = Modelica.Units.Conversions.from_deg(30);
  parameter Modelica.Units.SI.Angle pitch0 = Modelica.Units.Conversions.from_deg(10);
  parameter Modelica.Units.SI.Angle roll0 = Modelica.Units.Conversions.from_deg(5);
  inner Modelica.Mechanics.MultiBody.World world(
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    "No gravity so only attitude is studied"
    annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body aircraft(
    m = 1000, I_11 = 1000, I_22 = 3000, I_33 = 3500, r_CM = {0, 0, 0},
    r_0(start = {0, 0, 0}, each fixed = true), v_0(start = {0, 0, 0}, each fixed = true),
    angles_fixed = true, angles_start = {yaw0, pitch0, roll0}, sequence_start = {3, 2, 1},
    w_0_fixed = true, w_0_start = {0, 0, 0})
    "Free body: no joint to world, so it has 6 DOF"
    annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles eulerSensor(sequence = {3, 2, 1})
    "angles = {yaw, pitch, roll} in rad"
    annotation(Placement(transformation(extent = {{30, -10}, {50, 10}})));
equation
  connect(aircraft.frame_a, eulerSensor.frame_a);
  annotation(experiment(StopTime = 2));
end AttitudeInit;
