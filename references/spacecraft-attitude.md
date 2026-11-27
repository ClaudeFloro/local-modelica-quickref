# Spacecraft attitude and orbit frames (equation-based models)

Use this for satellite attitude written with equations (Euler angles, direction cosine matrices,
quaternions, orbit frame). For aircraft built from MultiBody parts, see "Aircraft attitude / Euler
angles" in `msl-catalog.md`. Every formula below was checked by simulation in Sysplorer 2026b,
MSL 4.0.0.TY.1.

## Conventions (state them in the model, then keep them)

- **Passive DCM**: `C_ba` maps components from frame a to frame b: `x_b = C_ba * x_a`.
- **3-2-1 Euler angles** `E = {phi, theta, psi}` (roll, pitch, yaw): `C_ba = Rx(phi) * Ry(theta) * Rz(psi)`.

```modelica
// 3-2-1, passive; cp = cos(phi), sp = sin(phi), ct = cos(theta), ...
C = {{ct*cs,              ct*ss,              -st},
     {sp*st*cs - cp*ss,   sp*st*ss + cp*cs,   sp*ct},
     {cp*st*cs + sp*ss,   cp*st*ss - sp*cs,   cp*ct}};
// back to angles (principal values)
phi   = atan2(C[2,3], C[3,3]);
theta = -asin(C[1,3]);
psi   = atan2(C[1,2], C[1,1]);
```

- **Declarations** (rule 2b): angles and rates carry SI types; DCMs, unit vectors and quaternions are
  dimensionless `Real`:

```modelica
import SI = Modelica.Units.SI;
parameter SI.AngularVelocity n = 0.0011 "orbit rate";
SI.Angle E[3] "3-2-1 Euler angles {phi, theta, psi}";
SI.Angle alpha "angle between sun vector and body +x";
SI.AngularVelocity w[3] "body rates in body axes";
SI.Torque tau[3] "control torque";
Real C[3, 3] "DCM (dimensionless)";
Real s_b[3] "unit vector in body axes (dimensionless)";
Real q[4] "quaternion, scalar first (dimensionless)";
```

- **Orbit frame (LVLH)**: z to the Earth centre, x along the velocity, y = negative orbit normal.
  Circular orbit in the inertial x-y plane, satellite on +x at t = 0, argument of latitude `u = n*time`:

```modelica
Coi = {{-sin(u), cos(u), 0}, {0, 0, -1}, {-cos(u), -sin(u), 0}};   // inertial -> orbit
```

- **Composition** (the most common error): body relative to orbit is

```modelica
Cbo = Cbi * transpose(Coi);      // correct:  x_b = Cbi * x_i = Cbi * Coi' * x_o
// Cbo = Coi * Cbi;              // WRONG: compiles and simulates, angles off by up to 90 deg
```

- **Quaternion, scalar first** `q = {q0, q1, q2, q3}`, body rates `w` in body axes:

```modelica
der(q) = 0.5*{-w[1]*q[2] - w[2]*q[3] - w[3]*q[4],
               w[1]*q[1] + w[3]*q[3] - w[2]*q[4],
               w[2]*q[1] - w[3]*q[2] + w[1]*q[4],
               w[3]*q[1] + w[2]*q[2] - w[1]*q[3]};
// 3-2-1 angles from q (same passive DCM as above)
phi   = atan2(2*(q[1]*q[2] + q[3]*q[4]), 1 - 2*(q[2]^2 + q[3]^2));
theta = asin(max(-1, min(1, 2*(q[1]*q[3] - q[4]*q[2]))));
psi   = atan2(2*(q[1]*q[4] + q[2]*q[3]), 1 - 2*(q[3]^2 + q[4]^2));
```

## Names that do not exist (seen in generated code)

| Written | Use instead |
|---|---|
| `Modelica.Math.sqrt(x)` | built-in `sqrt(x)` |
| `Modelica.Matrices.Identity(3)`, `Modelica.Math.Matrices.identity(3)` | built-in `identity(3)` |
| `J*w` with `J[3]` a vector of principal inertias | `{J[1]*w[1], J[2]*w[2], J[3]*w[3]}` or `diagonal(J)*w` |
| `cross(a, b)[i]` (indexing a call) | assign `v = cross(a, b)` first, then `v[i]` |
| `SI.ElectricResistance`, `SI.ElectricPower` | `SI.Resistance`, `SI.Power` |
| `SI.Radian`, `SI.deg`, `SI.Degree` | `SI.Angle` (rad); degrees via `Modelica.Units.Conversions.from_deg(...)` |
| `SI.GravitationalConstant`, `SI.AreaPerTime` | `Real mu(unit = "m3/s2")`, `Real h(unit = "m2/s")`; G itself is `Modelica.Constants.G` |
| `__Modelica_ImplicitInterval(...)` or other invented annotations | only `experiment(StartTime=, StopTime=, Interval=, Tolerance=)` |

## Self-checks before you report (add them as variables and look at the result)

1. **Identity case**: set the body attitude equal to the orbit frame (`Cbi = Coi`); `Ebo` must stay {0, 0, 0}.
2. **Orthonormality**: `C*transpose(C)` = identity and `Modelica.Math.Matrices.det(C)` = 1 at all times.
3. **Quaternion norm** stays 1 (drift < 1e-6 with tolerance 1e-8).
4. **Conserved quantity**: without external torque, `|J*w + h|` (body + wheels) is constant.
5. **Initial conditions**: give start values only for states. Fixing both `q` and Euler angles, or both
   `h` and the wheel speed, gives "初始条件冗余" / "方程冗余" (errors 6140, 6142).
6. **Simulation length**: use exactly the StopTime and Interval the task asks for.
