# Verified MSL 4.0 catalog (Modelica 4.0.0.TY.1)

Every class below was checked with `ClassExist` and `GetComponents(cls, "", True)` in
Sysplorer 2026b. Ports are in **bold**. Main parameters follow. Use exactly these names.

## Units (types only, use for `parameter` declarations)

`Modelica.Units.SI.` + `Mass`, `Length`, `Position`, `Velocity`, `Acceleration`, `Force`,
`Time`, `Frequency`, `Angle`, `AngularVelocity`, `Torque`, `Inertia`,
`TranslationalSpringConstant`, `TranslationalDampingConstant`,
`RotationalSpringConstant`, `RotationalDampingConstant`,
`Resistance`, `Capacitance`, `Inductance`, `Voltage`, `Current`,
`Temperature`, `HeatCapacity`, `ThermalConductance`, `HeatFlowRate`.

Do not use: `SpringStiffness`, `DamperCoefficient`, `MovableMass`, `MovableSpring`,
`MovableDamper`, `MovableSpringAnchor` (none exist).

## Translational mechanics — `Modelica.Mechanics.Translational.`

| Class | Ports | Parameters / key variables |
|---|---|---|
| `Components.Fixed` | **flange** | `s0` |
| `Components.Mass` | **flange_a**, **flange_b** | `m`, `L`; states `s`, `v` (set `s(start=..., fixed=true)`, `v(start=..., fixed=true)`) |
| `Components.Spring` | **flange_a**, **flange_b** | `c`, `s_rel0` |
| `Components.Damper` | **flange_a**, **flange_b** | `d` |
| `Components.SpringDamper` | **flange_a**, **flange_b** | `c`, `d`, `s_rel0` |
| `Components.MassWithStopAndFriction` | **flange_a**, **flange_b** | `m`, `L`, `smax`, `smin`, `F_prop`, ... |
| `Sources.Force` | **flange**, input **f** | — (drive `f` from a block) |
| `Sources.ConstantForce` | **flange** | `f_constant` |
| `Sources.Position` | **flange**, input **s_ref** | `exact`, `f_crit` |
| `Sources.Speed` | **flange**, input **v_ref** | `exact`, `f_crit` |
| `Sensors.PositionSensor` | **flange**, output **s** | — |
| `Sensors.SpeedSensor` | **flange**, output **v** | — |
| `Sensors.ForceSensor` | **flange_a**, **flange_b**, output **f** | — |

## Rotational mechanics — `Modelica.Mechanics.Rotational.`

| Class | Ports | Parameters / key variables |
|---|---|---|
| `Components.Fixed` | **flange** | `phi0` |
| `Components.Inertia` | **flange_a**, **flange_b** | `J`; states `phi`, `w` |
| `Components.Spring` | **flange_a**, **flange_b** | `c`, `phi_rel0` |
| `Components.Damper` | **flange_a**, **flange_b** | `d` |
| `Components.SpringDamper` | **flange_a**, **flange_b** | `c`, `d`, `phi_rel0` |
| `Components.IdealGear` | **flange_a**, **flange_b** | `ratio` |
| `Sources.Torque` | **flange**, input **tau** | — |
| `Sources.ConstantTorque` | **flange** | `tau_constant` |
| `Sources.Speed` | **flange**, input **w_ref** | `exact`, `f_crit` |
| `Sensors.AngleSensor` | **flange**, output **phi** | — |
| `Sensors.SpeedSensor` | **flange**, output **w** | — |

## Electrical analog — `Modelica.Electrical.Analog.`

| Class | Ports | Parameters |
|---|---|---|
| `Basic.Ground` | **p** | — (every circuit needs one) |
| `Basic.Resistor` | **p**, **n** | `R` |
| `Basic.Capacitor` | **p**, **n** | `C`; state `v` |
| `Basic.Inductor` | **p**, **n** | `L`; state `i` |
| `Basic.VariableResistor` | **p**, **n**, input **R** | — |
| `Basic.RotationalEMF` | **p**, **n**, **flange** | `k` (motor constant). There is no `Basic.EMF` in MSL 4 |
| `Basic.TranslationalEMF` | **p**, **n**, **flange** | `k` |
| `Sources.ConstantVoltage` | **p**, **n** | `V` |
| `Sources.StepVoltage` | **p**, **n** | `V`, `offset`, `startTime` |
| `Sources.SineVoltage` | **p**, **n** | `V`, `f`, `phase`, `offset`, `startTime` |
| `Sources.SignalVoltage` | **p**, **n**, input **v** | — |
| `Sources.ConstantCurrent` | **p**, **n** | `I` |
| `Sensors.VoltageSensor` | **p**, **n**, output **v** | — |
| `Sensors.CurrentSensor` | **p**, **n**, output **i** | — |
| `Ideal.IdealDiode` | **p**, **n** | `Ron`, `Goff`, `Vknee` |
| `Ideal.IdealOpeningSwitch` | **p**, **n**, input **control** | `Ron`, `Goff` |

## Heat transfer — `Modelica.Thermal.HeatTransfer.`

| Class | Ports | Parameters |
|---|---|---|
| `Components.HeatCapacitor` | **port** | `C`; state `T` |
| `Components.ThermalConductor` | **port_a**, **port_b** | `G` |
| `Components.Convection` | **solid**, **fluid**, input **Gc** | — |
| `Sources.FixedTemperature` | **port** | `T` |
| `Sources.FixedHeatFlow` | **port** | `Q_flow` |
| `Sources.PrescribedHeatFlow` | **port**, input **Q_flow** | — |
| `Sources.PrescribedTemperature` | **port**, input **T** | — |
| `Sensors.TemperatureSensor` | **port**, output **T** | — |

## Signal blocks — `Modelica.Blocks.`

Inputs are `u` (or `u1`, `u2`), output is `y`.

| Class | Parameters |
|---|---|
| `Sources.Constant` | `k` |
| `Sources.Step` | `height`, `offset`, `startTime` |
| `Sources.Ramp` | `height`, `duration`, `offset`, `startTime` |
| `Sources.Sine` | `amplitude`, `f`, `phase`, `offset`, `startTime` (not `A`, `freqHz`, `y0`) |
| `Sources.Pulse` | `amplitude`, `width`, `period`, `nperiod`, `offset`, `startTime` |
| `Sources.TimeTable` | `table` (e.g. `[0,0; 1,1; 2,0]`), `offset`, `startTime` |
| `Math.Gain` | `k` |
| `Math.Add` | `k1`, `k2` |
| `Math.Feedback` | — (y = u1 - u2) |
| `Math.Product` | — |
| `Continuous.Integrator` | `k`, `initType`, `y_start` |
| `Continuous.FirstOrder` | `k`, `T`, `initType`, `y_start` |
| `Continuous.TransferFunction` | `b`, `a` (coefficient vectors) |
| `Continuous.PID` | `k`, `Ti`, `Td`, `Nd` |
| `Continuous.LimPID` | inputs **u_s**, **u_m**; `controllerType`, `k`, `Ti`, `Td`, `yMax`, `yMin` |
| `Nonlinear.Limiter` | `uMax`, `uMin` |

## MultiBody (3D) — `Modelica.Mechanics.MultiBody.`

Every MultiBody model needs exactly one `inner Modelica.Mechanics.MultiBody.World world;`.
Frames are **frame_a**, **frame_b**. For a 1-D problem prefer Translational/Rotational.

| Class | Parameters |
|---|---|
| `World` | `g`, `n` (gravity direction), `animateGround` |
| `Parts.Fixed` | `r` |
| `Parts.Body` | `m`, `r_CM`, `I_11`, `I_22`, `I_33` |
| `Parts.BodyBox` | `r`, `length`, `width`, `height`, `density` |
| `Parts.BodyCylinder` | `r`, `length`, `diameter`, `density` |
| `Parts.FixedTranslation` | `r` |
| `Joints.Revolute` | `n` (axis); states `phi`, `w`; `useAxisFlange` |
| `Joints.Prismatic` | `n` (axis); states `s`, `v`; `useAxisFlange` |
| `Forces.Spring` | `c`, `s_unstretched` |
| `Forces.Damper` | `d` |
| `Forces.SpringDamperParallel` | `c`, `d`, `s_unstretched` |

### Aircraft attitude / Euler angles (verified by simulation)

Templates: `AttitudeInit` (set initial yaw/pitch/roll), `AttitudeTorque` (body-axis torque),
`AttitudeControl` (PD controller to target angles), `AttitudeVectors` (nose / wing direction
vectors and position in ground coordinates). Copy one instead of writing from scratch.

| Class | Ports | Parameters / notes |
|---|---|---|
| `Parts.Body` (free, no joint) | **frame_a** | 6-DOF rigid body. Initial attitude: `angles_fixed = true`, `angles_start = {yaw, pitch, roll}`, `sequence_start = {3, 2, 1}`; also `w_0_fixed`, `w_0_start`, `r_0(start=..., each fixed=true)`, `v_0(...)` |
| `Joints.FreeMotionScalarInit` | **frame_a**, **frame_b** | Same initialization between two frames: `use_angle = true`, `sequence_start`, then set the start of the conditional outputs, e.g. `angle_1(start = ..., fixed = true)`. Prefer the free `Body` above |
| `Sensors.AbsoluteAngles` | **frame_a**, output **angles[3]** | `sequence = {3, 2, 1}` returns `{yaw, pitch, roll}` in rad |
| `Sensors.AbsoluteAngularVelocity` | **frame_a**, output **w[3]** | Body rates `{p, q, r}` (default `resolveInFrame = frame_a`, i.e. body axes) |
| `Forces.WorldTorque` | **frame_b**, input **torque[3]** | `resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b` gives torque in body axes |
| `Forces.WorldForce` | **frame_b**, input **force[3]** | Same `resolveInFrame` rule |
| `Sensors.AbsolutePosition` | **frame_a**, output **r[3]** | **Default `resolveInFrame = frame_a` (body axes)**. For ground coordinates set `resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world`. Same default for `AbsoluteVelocity` |
| `Frames.resolve1(R, v_body)` | function | Body-axis vector -> ground (world) vector. Nose direction: `resolve1(aircraft.frame_a.R, {1,0,0})` (template `AttitudeVectors`) |
| `Frames.resolve2(R, v_world)` | function | Ground vector -> body axes |
| `Frames.axesRotations(sequence, angles, der_angles)` | function | Euler angles -> `Orientation` **record** (needs `der_angles`; not a matrix, do not index it with `[:, 1]`). Use `resolve1` on `frame_a.R` instead |
| `Frames.axesRotationsAngles(R, sequence)` | function | `Orientation` -> Euler angles |

Rules that models get wrong:
- **Sequence**: MSL default is `{1,2,3}`. Aerospace yaw-pitch-roll is `{3,2,1}` with angles in the
  order `{yaw, pitch, roll}`. Set it on both `Body.sequence_start` and `AbsoluteAngles.sequence`.
- **Two index orders**: `angles` is `{yaw, pitch, roll}`, but body axes / torque / `w` are
  `{x = roll, y = pitch, z = yaw}`. Map `angles[1]` to `torque[3]` and `angles[3]` to `torque[1]`.
- **Units**: angles are rad. Convert with `Modelica.Units.Conversions.from_deg(...)`.
- **Gravity / axes**: `World` default gravity is along -y. To study attitude only, use
  `world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)`. `World.n` is the
  gravity direction (default `{0, -1, 0}`); for a NED (z-down) convention set `world(n = {0, 0, 1})`.
- **Gimbal lock**: Euler angles are singular at pitch = ±90°. Keep `Body.useQuaternions = true`
  (default) so the states are quaternions; only the sensor output uses Euler angles.
- **MSL angle range differs from the textbook**: `AbsoluteAngles` picks `angles[1]` closest to
  `guessAngle1` (default 0) and computes the others with `atan2`, so pitch can exceed ±90°.
  Verified: pitching up through 90° gives `{0°, 114.585°, 0°}` at 2 s. The textbook form
  (pitch in [−90°, 90°]) of the same attitude is `{yaw+180°, 180°−pitch, roll+180°}` = `{180°, 65.4°, 180°}`.
  Both describe the same orientation; say which convention you report.
- **Ground position / NED**: `world(n = {0, 0, 1})` puts gravity along +z (down). Read position with
  `AbsolutePosition(resolveInFrame = ...world)`; with the default (body axes) a pitched aircraft
  shows a false x drift. Verified: free fall 2 s, pitch 10° -> r = {0, 0, 19.62} m.
- **Verified values**: `AttitudeTorque` with `tau = 350 N.m`, `I_33 = 3500` gives yaw 0.19998 rad at
  t = 2 s (theory 0.5*0.1*2^2 = 0.2); pitch and roll stay 0. `AttitudeControl` reaches {30°, 10°, 5°}.

## Connection rules

- Connect same kinds only: translational flange to translational flange, rotational to
  rotational, electrical pin to pin, heat port to heat port, real output `y` to real input `u`.
- A block output (`sine.y`) can drive a source input (`force.f`, `torque.tau`, `signalVoltage.v`).
- Mechanical chains need a reference: a `Fixed` component (1-D) or `world` (MultiBody).
- Electrical circuits need a `Ground`.
- Set initial conditions on the component's own states:
  `mass(s(start=0.05, fixed=true), v(start=0, fixed=true))`, `capacitor(v(start=0, fixed=true))`.

## Sign conventions (verified by simulation)

- `RotationalEMF(k > 0)`: wiring `voltage.p → R → L → emf.p` and `emf.n → ground` with a
  positive voltage gives **positive** speed (`DCMotor` template: +12 V → +200 rad/s).
  Keep `k > 0`. A negative `k` reverses torque and turns speed feedback into positive
  feedback, so a closed loop diverges.
- `LimPID`: setpoint into **u_s**, measurement into **u_m**. It computes `u_s - u_m`
  itself; do not add an extra `Feedback`/`Add` with a minus sign in front of it.
- `PID` (no `u_s`/`u_m`) takes the error on **u**: build it with
  `Modelica.Blocks.Math.Feedback` (`y = u1 - u2`, setpoint on `u1`, measurement on `u2`).
- Translational: positive `Force.f` pushes the flange in the positive `s` direction.
- If a closed loop diverges: (1) check every physical constant is positive,
  (2) check the setpoint/measurement inputs are not swapped, (3) only then retune gains.

## Error lookup (Sysplorer check messages)

| Code / message | Cause | Fix |
|---|---|---|
| 3001 `找不到继承语句的基类 X` | `extends X` names a class that does not exist | Use a real class from this file; you rarely need `extends` for a plain model |
| 3004 `组件的类型 X 查找不到` | Component type does not exist | Replace with the verified name; check with `get_classes` |
| 3044 `在类型 X 中找不到修改 A 对应的元素` | Wrong parameter name in a modifier | Use the parameter list above, or `get_lib_model_document` |
| 1101 `unexpected token` on load | Syntax error in a `.mo` file | Read the file back and fix syntax; each file needs `within Pkg;` (package.mo: no `within` or `within;`) |
| 3041 / 3082 `组件 a.b 查找不到` | Path to a sub-variable is wrong | Modify a state on the component that owns it, e.g. `mass(s(start=...))` |
| 2805 `文件 ... 被重复加载`, or package loaded but models missing | Sysplorer still holds an old copy of the package (often after a "模型库转换" dialog) | Do not edit files. `model_manager` `unload` the package, then `load_file` with `"force_reload": true`, then `get_classes` to confirm (SKILL.md rule 13) |
| Dialog "模型库转换 … 依赖 Modelica 4.0.0.TY.1，但是 Modelica 4.0 已加载" | A loaded package declares a different MSL version | End every top-level package you write with `annotation(uses(Modelica(version="4.0.0.TY.1")));` (inside `annotation(...)`; a bare `uses(...);` line is a syntax error) (SKILL.md rule 8) |
