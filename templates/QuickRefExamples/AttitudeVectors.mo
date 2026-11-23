within QuickRefExamples;
model AttitudeVectors "Body axis directions and position in the ground frame for an aircraft with fixed yaw/pitch/roll"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Angle yaw0 = Modelica.Units.Conversions.from_deg(30);
  parameter Modelica.Units.SI.Angle pitch0 = Modelica.Units.Conversions.from_deg(20);
  parameter Modelica.Units.SI.Angle roll0 = 0;
  inner Modelica.Mechanics.MultiBody.World world(
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body aircraft(
    m = 2000, I_11 = 1500, I_22 = 4000, I_33 = 5000, r_CM = {0, 0, 0},
    r_0(start = {0, 0, 0}, each fixed = true), v_0(start = {0, 0, 0}, each fixed = true),
    angles_fixed = true, angles_start = {yaw0, pitch0, roll0}, sequence_start = {3, 2, 1},
    w_0_fixed = true, w_0_start = {0, 0, 0})
    annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition position(
    resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
    "Default resolveInFrame is frame_a (body axes); set world for ground coordinates"
    annotation(Placement(transformation(extent = {{30, -40}, {50, -20}})));
  Real nose[3] "Unit vector of body x axis (nose) resolved in the ground (world) frame";
  Real rightWing[3] "Unit vector of body y axis resolved in the ground frame";
equation
  connect(aircraft.frame_a, position.frame_a);
  // frame_a.R is the orientation world -> body. resolve1 maps a vector given in body
  // coordinates to world coordinates; resolve2 does the opposite.
  nose = Modelica.Mechanics.MultiBody.Frames.resolve1(aircraft.frame_a.R, {1, 0, 0});
  rightWing = Modelica.Mechanics.MultiBody.Frames.resolve1(aircraft.frame_a.R, {0, 1, 0});
  annotation(experiment(StopTime = 1));
end AttitudeVectors;
