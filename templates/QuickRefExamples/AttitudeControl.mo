within QuickRefExamples;
model AttitudeControl "PD attitude controller turns a free rigid body (aircraft) to target yaw/pitch/roll"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Angle target[3] = Modelica.Units.Conversions.from_deg({30, 10, 5})
    "Target {yaw, pitch, roll}";
  parameter Modelica.Units.SI.Inertia I[3] = {1000, 3000, 3500} "Body inertia about x, y, z";
  parameter Real wn = 2 "Closed-loop natural frequency in rad/s";
  parameter Real zeta = 1 "Damping ratio";
  inner Modelica.Mechanics.MultiBody.World world(
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body aircraft(
    m = 1000, I_11 = I[1], I_22 = I[2], I_33 = I[3], r_CM = {0, 0, 0},
    r_0(start = {0, 0, 0}, each fixed = true), v_0(start = {0, 0, 0}, each fixed = true),
    angles_fixed = true, angles_start = {0, 0, 0}, sequence_start = {3, 2, 1},
    w_0_fixed = true, w_0_start = {0, 0, 0})
    annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Forces.WorldTorque torque(
    resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)
    "Torque components in body axes {x (roll), y (pitch), z (yaw)}"
    annotation(Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles eulerSensor(sequence = {3, 2, 1})
    "angles = {yaw, pitch, roll} in rad"
    annotation(Placement(transformation(extent = {{30, -10}, {50, 10}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity rateSensor
    "Body rates {p, q, r} resolved in body axes (default resolveInFrame = frame_a)"
    annotation(Placement(transformation(extent = {{30, -40}, {50, -20}})));
equation
  connect(torque.frame_b, aircraft.frame_a);
  connect(aircraft.frame_a, eulerSensor.frame_a);
  connect(aircraft.frame_a, rateSensor.frame_a);
  // Angle order is {yaw, pitch, roll}; body axis order is {x=roll, y=pitch, z=yaw}.
  // PD per axis with gains scaled by inertia: Kp = I*wn^2, Kd = 2*zeta*wn*I.
  torque.torque[1] = I[1]*(wn^2*(target[3] - eulerSensor.angles[3]) - 2*zeta*wn*rateSensor.w[1]);
  torque.torque[2] = I[2]*(wn^2*(target[2] - eulerSensor.angles[2]) - 2*zeta*wn*rateSensor.w[2]);
  torque.torque[3] = I[3]*(wn^2*(target[1] - eulerSensor.angles[1]) - 2*zeta*wn*rateSensor.w[3]);
  annotation(experiment(StopTime = 10));
end AttitudeControl;
