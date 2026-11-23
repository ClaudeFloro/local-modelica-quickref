---
name: local-modelica-quickref
description: >-
  Exact cheat-sheet for building, checking and simulating Modelica models in Sysplorer
  through sysplorer-mcp-server. Use whenever writing or fixing .mo code, choosing
  Modelica Standard Library (MSL 4.0) components, or calling sysplorer-mcp-server tools
  (model_manager, check_model, simulate_model, model_inspect, call_code,
  get_lib_model_document, resources_retrieval). Gives verified class names, parameter
  names, port names and exact tool argument names so nothing has to be guessed.
  Complements ty-sysplorer-modeling-rules; follow that skill's workflow and use this one
  for names and arguments.
metadata:
  short-description: Verified MSL 4.0 names and sysplorer-mcp tool arguments
  version: 1.5.3
  verified-against: Sysplorer 2026b, Modelica 4.0.0.TY.1, sysplorer-mcp 0.6
---

# Local Modelica Quick Reference

## Hard rules

1. **Never invent a Modelica class name.** Use a name from `references/msl-catalog.md`,
   or confirm it first with `model_inspect` `get_classes` or `ClassExist` (see below).
2. `Modelica.Units.SI` contains **unit types only** (Mass, Length, Force ...). It has no
   components. Components live in `Modelica.Mechanics.*`, `Modelica.Electrical.*`,
   `Modelica.Thermal.*`, `Modelica.Blocks.*`.
3. **Never guess tool or argument names.** Copy the call shapes in
   `references/tool-args.md` exactly. If unsure, call `mcp.help` with the exact
   qualified name, e.g. `sysplorer-mcp-server:check_model`.
4. Every tool call through `mcp.call` has exactly three keys:
   `{"server": "<server>", "tool": "<tool>", "args": {...}}`.
   `<server>` is the prefix before `:` in the tool names that `mcp.list` prints
   (in the Sysplorer sidebar it is `sysplorer-mcp-server`; elsewhere it may be `sysplorer`).
   Call `mcp.list` once, then reuse that exact prefix. `tool` has no prefix.
   There is no `health` or `mcp_help` tool; health is `session_manager` with `{"action": "health"}`.
5. Before setting a parameter or connecting a port of a class you have not used before,
   read its documentation once: `get_lib_model_document` with `full_class_names`
   (one call, up to 50 classes).
6. **Start from the closest template** in `templates/QuickRefExamples/` and change only
   parameters and the parts the task needs. For closed-loop control use `DCMotorSpeedPID`.
7. **If a simulation diverges or has the wrong sign, check signs and connections first.**
   Physical constants stay positive (`k`, `R`, `J`, `c`, `d` > 0). Do not make a constant
   negative to "fix" direction, and never conclude that a standard plant cannot be
   controlled. See "Sign conventions" in `references/msl-catalog.md`.
8. Each model file starts with `within <YourPackage>;`, never `within Modelica;`.
   Your `package.mo` must declare the MSL version that is loaded in Sysplorer, normally
   `annotation(uses(Modelica(version="4.0.0.TY.1")));` (confirm with `session_manager`
   `get_loaded_models`). A different version (e.g. `"4.0.0"`) makes Sysplorer open a
   "模型库转换" dialog that blocks every later tool call until a person answers it.
   Read the skill's template packages with `file.read`; do not `load_file` them.
9. **Aircraft attitude / Euler angles**: start from `AttitudeInit`, `AttitudeTorque`,
   `AttitudeControl` or `AttitudeVectors` and read "Aircraft attitude / Euler angles" in
   `references/msl-catalog.md`. Use sequence `{3,2,1}` with angles `{yaw, pitch, roll}`, angles
   in rad, and remember body axes are `{x = roll, y = pitch, z = yaw}`. Direction vectors use
   `Frames.resolve1(body.frame_a.R, {1,0,0})`; ground position needs
   `AbsolutePosition(resolveInFrame = ...world)` (default is body axes).
9b. **Spacecraft attitude / orbit frame written with equations** (Euler angles, DCM, quaternions,
   LVLH): read `references/spacecraft-attitude.md` first. Passive DCM, `C = Rx(phi)*Ry(theta)*Rz(psi)`
   for 3-2-1, body-to-orbit is `Cbo = Cbi*transpose(Coi)` (the reversed product compiles but is wrong),
   and run the self-checks listed there before reporting.
10. **Language patterns you have not written before** (equation-based models, arrays and
    `for` loops, functions, `when`/events/sampling, writing your own connectors and acausal
    components, hierarchical subsystems, `replaceable`): find a matching example in
    `references/mbe-index.md`, read that class's `.mo` file under
    `templates/ModelicaByExample/`, then write your own version in your package. All listed
    examples are verified on MSL 4.0. Do not edit the library itself.
11. **If the same check error appears twice**, stop editing and look it up first:
    `get_lib_model_document` for the MSL class, the error table in `references/msl-catalog.md`,
    or a working example in `references/mbe-index.md`.
12. **System-level task with MSL components** (circuits, machines, drives, multibody
    mechanisms, fluid/thermal systems, clocked control): open `references/msl-examples-index.md`,
    then only the one domain file you need, pick the closest case and `file.read` its
    `templates/MslCases/<Name>.mo`. These copies use fully qualified names and check on their own,
    so copy from them, not from the original MSL example (MSL examples use short relative names
    such as `Sources.Step` or `SI.Time` that fail outside the MSL package).
13. **Stale package in Sysplorer** — loading reports error 2805 `被重复加载` (loaded twice), or
    your package loads but `get_classes` shows no models / `ClassExist` is False for a model whose
    file exists: the files are fine, Sysplorer holds an old copy. Do not edit or move files.
    Fix it in this order:
    1. `model_manager` `{"action": "unload", "model_name": "<Pkg>"}`
    2. `model_manager` `{"action": "load_file", "file_path": "<abs path>\\<Pkg>\\package.mo", "force_reload": true}`
    3. `model_inspect` `{"action": "get_classes", "model_name": "<Pkg>"}` and confirm your models are listed.
    If they are still missing, check that `package.order` lists them and that each file starts with
    `within <Pkg>;`, then repeat 1-3 once. This often happens after a "模型库转换" dialog was answered.

## Build loop (shortest path)

1. Write the package with `file.write`: `<Pkg>/package.mo`, `<Pkg>/package.order`,
   one `<Model>.mo` per model (first line `within <Pkg>;`).
   A verified working package is in `templates/QuickRefExamples/` — copy its structure.
2. Load: `model_manager` `load_file` with the absolute path to `package.mo`.
   After every edit, load again with `"force_reload": true`.
3. Check: `check_model` with `model_name` (or `model_names` list).
4. On error, fix only what the message names, reload, re-check.
   Typical messages and fixes are in `references/msl-catalog.md` ("Error lookup").
5. Simulate: `simulate_model` with `model_name`, and `verify_result_var` set to one
   variable you expect (for example `mass.s`) to get its end value back in one call.
6. Read text back: `model_inspect` `get_model_text` (not `get_text`).

## Verifying a name you are unsure of

- List a package level: `model_inspect` `{"action": "get_classes", "model_name": "Modelica.Mechanics.Translational.Components"}`
- Check many names in one call: `call_code`
  `{"mode": "run_sysplorer_api", "payload": {"output_paths": [], "python_source": "import mworks.sysplorer as ModelingPy\nfor c in ['A.B','C.D']:\n    print(c, ModelingPy.ClassExist(c))"}}`
- List parameters and ports including inherited ones:
  `ModelingPy.GetComponents("<FullClassName>", "", True)` inside `call_code`.

## Files

| File | Use it for |
|---|---|
| `references/tool-args.md` | Exact argument names and examples for every sysplorer-mcp-server tool |
| `references/msl-catalog.md` | Verified MSL 4.0 classes with their parameters and ports, plus error lookup |
| `references/mbe-index.md` | 156 verified runnable examples from the ModelicaByExample library, grouped by topic |
| `references/msl-examples-index.md` | 322 MSL 4.0 cases verified against official reference results, by domain (one file per domain in `references/msl-examples/`) |
| `templates/MslCases/` | The 322 cases as standalone models (package `MslCases`, fully qualified names); license in `templates/LICENSE-MSL.txt` |
| `templates/ModelicaByExample/` | ModelicaByExample library (MIT, M. Tiller), converted to MSL 4.0; license in `templates/LICENSE-ModelicaByExample.txt` |
| `references/spacecraft-attitude.md` | Satellite attitude with equations: passive DCM, 3-2-1 formulas, orbit frame, composition rule, quaternion kinematics, names that do not exist, self-checks |
| `templates/QuickRefExamples/` | Eight models that pass check and simulate (end values verified): `MassSpringDamper`, `RCCircuit` (capacitor 9.999 V of 10 V), `DCMotor` (open loop, 200 rad/s), `DCMotorSpeedPID` (LimPID closed loop, 100.0 rad/s at setpoint 100), `AttitudeInit` (aircraft initial yaw/pitch/roll 30°/10°/5° read back), `AttitudeTorque` (body yaw torque, yaw 0.2 rad at 2 s), `AttitudeControl` (PD attitude control to 30°/10°/5°), `AttitudeVectors` (nose vector {0.8138, 0.4698, -0.3420} at yaw 30°, pitch 20°; ground position) |
