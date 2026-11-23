# Verified MSL 4.0 cases (index)

Each case is a standalone copy of an MSL example in `templates/MslCases/<Name>.mo`
(package `MslCases`). In Sysplorer 2026b every copy checks on its own, simulates, and matches
the official MSL 4.0.0 reference results (max relative error < 5 %). All class names inside are
fully qualified, so the code can be copied into your own package as is.
Open only the domain file you need; each line is `file` — Chinese summary — original MSL class.
Read the file with `file.read`, then write your own model in your package.

| Domain | Cases | File |
|---|---|---|
| Blocks.Examples | 15 | `references/msl-examples/Blocks_Examples.md` |
| Clocked.Examples | 16 | `references/msl-examples/Clocked_Examples.md` |
| ComplexBlocks.Examples | 2 | `references/msl-examples/ComplexBlocks_Examples.md` |
| Electrical.Analog | 41 | `references/msl-examples/Electrical_Analog.md` |
| Electrical.Batteries | 8 | `references/msl-examples/Electrical_Batteries.md` |
| Electrical.Digital | 18 | `references/msl-examples/Electrical_Digital.md` |
| Electrical.Machines | 33 | `references/msl-examples/Electrical_Machines.md` |
| Electrical.Polyphase | 4 | `references/msl-examples/Electrical_Polyphase.md` |
| Electrical.QuasiStatic | 10 | `references/msl-examples/Electrical_QuasiStatic.md` |
| Electrical.Spice3 | 13 | `references/msl-examples/Electrical_Spice3.md` |
| Fluid.Examples | 17 | `references/msl-examples/Fluid_Examples.md` |
| Magnetic.FluxTubes | 5 | `references/msl-examples/Magnetic_FluxTubes.md` |
| Magnetic.FundamentalWave | 26 | `references/msl-examples/Magnetic_FundamentalWave.md` |
| Magnetic.QuasiStatic | 24 | `references/msl-examples/Magnetic_QuasiStatic.md` |
| Mechanics.MultiBody | 31 | `references/msl-examples/Mechanics_MultiBody.md` |
| Mechanics.Rotational | 9 | `references/msl-examples/Mechanics_Rotational.md` |
| Mechanics.Translational | 13 | `references/msl-examples/Mechanics_Translational.md` |
| Media.Examples | 19 | `references/msl-examples/Media_Examples.md` |
| Media.Incompressible | 1 | `references/msl-examples/Media_Incompressible.md` |
| StateGraph.Examples | 1 | `references/msl-examples/StateGraph_Examples.md` |
| Thermal.FluidHeatFlow | 11 | `references/msl-examples/Thermal_FluidHeatFlow.md` |
| Thermal.HeatTransfer | 3 | `references/msl-examples/Thermal_HeatTransfer.md` |
| Utilities.Examples | 2 | `references/msl-examples/Utilities_Examples.md` |
