# local-modelica-quickref

A skill for the Sysplorer 2026b sidebar agent (Mogick) that gives verified Modelica Standard Library (MSL 4.0)
names, Sysplorer MCP tool arguments, simulation-checked templates and domain references, so the agent does not
have to guess class names, parameters or conventions.

Current version: **1.5.4** (see `SKILL.md` front matter). Verified against Sysplorer 2026b, Modelica 4.0.0.TY.1,
sysplorer-mcp 0.6.

## Contents

| Path | Content |
|---|---|
| `SKILL.md` | Entry point: hard rules, build loop, file index |
| `references/msl-catalog.md` | Verified MSL 4.0 class, parameter and port names; sign conventions; common errors |
| `references/spacecraft-attitude.md` | Satellite attitude with equations: passive DCM, 3-2-1 angles, orbit frame, composition rule, quaternions, self-checks |
| `references/tool-args.md` | Exact call shapes of the sysplorer-mcp tools |
| `references/mbe-index.md`, `msl-examples-index.md`, `msl-examples/` | Indexes of language and library examples |
| `templates/QuickRefExamples/` | Eight models that pass check and simulate |
| `templates/MslCases/`, `templates/ModelicaByExample/` | Example models (third-party, see licenses below) |

## Install

Copy the whole directory to the sidebar's skill folder (keep the directory name):

```
%USERPROFILE%\.mworks\mogick\Sysplorer\skills\local-modelica-quickref\
```

Back up the existing directory first (the sidebar keeps old versions in `...\Sysplorer\skills-backup\`).

## Changes in 1.5.4

- `SKILL.md`: new hard rule 2b - every quantity with a unit is declared with its SI type (`SI.Angle`,
  `SI.AngularVelocity`, `SI.Torque` ...), parameters and variables alike, including short test models;
  plain `Real` only for dimensionless quantities (DCM, unit vector, quaternion). A unit in a comment does not count.
- `references/spacecraft-attitude.md`: new declaration example (angles, rates, torque, DCM, unit vector, quaternion).
- Measured with Qwen3.8-27B on 24 modeling tasks x 6 runs: answers that declare SI-typed quantities rose
  from 106/144 (1.5.3) to 121/144; attitude and component tasks reach 36/36 and 60/60.

## Changes in 1.5.3

- `references/msl-catalog.md`: the `uses` annotation is now written as
  `annotation(uses(Modelica(version="4.0.0.TY.1")));` - the previous wording led models to emit a bare
  `uses(...);` line, which is a syntax error.
- New `references/spacecraft-attitude.md`, linked from `SKILL.md` rule 9b.

## Licenses

- `templates/MslCases/`: from the Modelica Standard Library 4.0.0, BSD 3-Clause (`templates/LICENSE-MSL.txt`).
- `templates/ModelicaByExample/`: from github.com/xogeny/ModelicaBook, MIT (`templates/LICENSE-ModelicaByExample.txt`).
- Everything else: written for this project.
