# ModelicaByExample — verified runnable examples (MSL 4.0)

Library: `templates/ModelicaByExample/` (MIT, Michael Tiller; converted to MSL 4.0, see
`templates/LICENSE-ModelicaByExample.txt`). Load it with `model_manager` `load_file` on
`templates/ModelicaByExample/package.mo`.

Every class below passed `CheckModel` and simulated in Sysplorer 2026b (Modelica 4.0.0.TY.1).
`[exp]` = has its own experiment settings; others ran with default settings (0-1 s).
Use them to see how a modeling pattern is written, then write your own model in your package
(do not save edits into the library). Components such as `Components.Electrical.*.Resistor` are
building blocks and do not simulate alone; they are not listed.

Not listed: 9 classes that fail the check on purpose or need MSL 3 features
(e.g. `Architectures.ThermalControl.Bogus.*`, array out-of-bounds demos, `sample(0, parameter)`).

## Architectures (sensor comparison, thermal control, replaceable controllers)

- `Architectures.SensorComparison.Examples.BaseSystem` — System architecture with base implementations
- `Architectures.SensorComparison.Examples.FlatSystem` [exp] — A rotational system with no architecture
- `Architectures.SensorComparison.Examples.FlatSystem_Variation1` [exp] — Variation containing a different sensor model
- `Architectures.SensorComparison.Examples.HierarchicalSystem` — Organzing components into subsystems
- `Architectures.SensorComparison.Examples.HierarchicalSystem_Variant1` — Changing one subsystem of HierarchicalSystem
- `Architectures.SensorComparison.Examples.Variant1` — Creating sample-hold variant using system architecture
- `Architectures.SensorComparison.Examples.Variant1_unstable` — Choice of sample interval that creates an instability
- `Architectures.SensorComparison.Examples.Variant2` — Adds PID control and realistic actuator subsystems
- `Architectures.SensorComparison.Examples.Variant2_tuned` — A tuned up version of variant 2
- `Architectures.SensorComparison.Implementation.BasicPlant` — Implementation of the basic plant model
- `Architectures.SensorComparison.Implementation.ProportionalController` — Implementation of a proportional controller
- `Architectures.ThermalControl.Bogus.BusModel` — System model using normal bus connectors
- `Architectures.ThermalControl.Examples.BaseModel` — Base model using a conventional architecture
- `Architectures.ThermalControl.Examples.ExpandableModel` — Thermal system using expandable bus architecture
- `Architectures.ThermalControl.Examples.HysteresisVariant` — Using on-off controller with hysteresis
- `Architectures.ThermalControl.Examples.OnOffVariant` — Variation with on-off control
- `Architectures.ThermalControl.Implementations.OnOffControl` — An example of an on-off controller without hysteresis
- `Architectures.ThermalControl.Implementations.OnOffControl_WithHysteresis` — An example of an on-off controller with hysteresis

## Arrays and loops (vectors, discretized PDEs)

- `ArrayEquations.ChemicalReactions.Reactions_Array` — Modeling a chemical reaction with arrays
- `ArrayEquations.ChemicalReactions.Reactions_Enum` — Modeling a chemical reaction with enums
- `ArrayEquations.ChemicalReactions.Reactions_EnumMatrix` — Modeling a chemical reaction with matrix equations
- `ArrayEquations.ChemicalReactions.Reactions_NoArrays` — Modeling a chemical reaction without arrays
- `ArrayEquations.HeatTransfer.Rod_ArrayComprehensions` — Modeling heat conduction in a rod using array comprehensions
- `ArrayEquations.HeatTransfer.Rod_ForLoop` — Modeling heat conduction in a rod using a for loop
- `ArrayEquations.HeatTransfer.Rod_VectorNotation` — Modeling heat conduction in a rod using vector notation
- `ArrayEquations.StateSpace.Examples.FirstOrder` — Represent der(x) = 1-x
- `ArrayEquations.StateSpace.Examples.FirstOrder_Compact` — Represent der(x) = 1-x
- `ArrayEquations.StateSpace.Examples.LotkaVolterra` — Lotka-Volterra model in state space form
- `ArrayEquations.StateSpace.Examples.NewtonCooling` — NewtonCooling model in state space form
- `ArrayEquations.StateSpace.Examples.RLC` — State space version of an RLC circuit
- `ArrayEquations.StateSpace.Examples.RotationalSMD` — State space version of a rotational spring-mass-damper system
- `ArrayEquations.StateSpace.Examples.RotationalSMD_Concat` — State space version of a rotationals spring-mass-damper system using concatenation
- `ArrayEquations.StateSpace.LTI` — Equations written in ABCD form where matrices are also time-invariant

## Basic equations (ODEs, initialization, units)

- `BasicEquations.CoolingExample.NewtonCoolingWithDefaults` — Cooling example with default parameter values
- `BasicEquations.CoolingExample.NewtonCoolingWithTypes` — Cooling example with physical types
- `BasicEquations.CoolingExample.NewtonCoolingWithUnits` — Cooling example with physical units
- `BasicEquations.LotkaVolterra.ClassicModel` — This is the typical equation-oriented model
- `BasicEquations.LotkaVolterra.ClassicModelFixedStartValues` — This is the typical equation-oriented model
- `BasicEquations.LotkaVolterra.ClassicModelInitialEquations` — This is the typical equation-oriented model
- `BasicEquations.LotkaVolterra.ComplexInitialization` — Complex initial conditions
- `BasicEquations.LotkaVolterra.QuiescentModel` — Find steady state solutions to LotkaVolterra equations
- `BasicEquations.LotkaVolterra.QuiescentModelUsingStart` — Find steady state solutions to LotkaVolterra equations
- `BasicEquations.LotkaVolterra.QuiescentModelWithInheritance` — Steady state model with inheritance
- `BasicEquations.LotkaVolterra.QuiescentModelWithModifications` — Steady state model with modifications
- `BasicEquations.RLC.RLC1` — A resistor-inductor-capacitor circuit model
- `BasicEquations.RLC.RLC2` — (no description)
- `BasicEquations.RotationalSMD.SecondOrderSystem` — A second order rotational system
- `BasicEquations.RotationalSMD.SecondOrderSystemInitParams` — A second order rotational system with initialization parameters
- `BasicEquations.SimpleExample.FirstOrder` — (no description)
- `BasicEquations.SimpleExample.FirstOrderDocumented` — A simple first order differential equation
- `BasicEquations.SimpleExample.FirstOrderExperiment` [exp] — Defining experimental conditions
- `BasicEquations.SimpleExample.FirstOrderInitial` — First order equation with initial value
- `BasicEquations.SimpleExample.FirstOrderSteady` — First order equation with steady state initial condition

## Writing components (connectors, acausal resistor/heat/rotational parts, Lotka-Volterra)

- `Components.BlockDiagrams.Components.Constant` — A constant source
- `Components.BlockDiagrams.Components.Feedback` — A block to compute feedback terms
- `Components.BlockDiagrams.Components.Gain` — A gain block model
- `Components.BlockDiagrams.Components.Integrator` — This block integrates the input signal to compute the output signal
- `Components.BlockDiagrams.Components.Product` — Block that outputs the product of its inputs
- `Components.BlockDiagrams.Components.Sum` — Block that sums its inputs
- `Components.BlockDiagrams.Examples.ControlledCooling` — Adding a setpoint and control strategy
- `Components.BlockDiagrams.Examples.MultiDomainControl` — Mixing thermal components with blocks for sensing, actuation and control
- `Components.BlockDiagrams.Examples.NewtonCooling` — Newton cooling system modeled with blocks
- `Components.BlockDiagrams.Icons.Axes` — Introduces graphics for independent and dependent axes
- `Components.ChemicalReactions.ABX.Components.Solution` — A mixture of species A, B and X
- `Components.ChemicalReactions.Examples.ABX_System` — Model of simple two reaction system
- `Components.Electrical.DryApproach.Ground` — Electrical ground
- `Components.Electrical.Examples.SwitchedRLC` — Recreation of the switched RLC circuit
- `Components.HeatTransfer.AmbientCondition` — Model of an "infinite reservoir" at some ambient temperature
- `Components.HeatTransfer.Examples.Adiabatic` — A model without any heat transfer
- `Components.HeatTransfer.Examples.ComplexNetwork` — A complex heat transfer network
- `Components.HeatTransfer.Examples.Cooling` — A model using generic convection to ambient conditions
- `Components.HeatTransfer.Examples.CoolingToAmbient` — A model using convection to an ambient condition
- `Components.HeatTransfer.ThermalCapacitance` — A model of thermal capacitance
- `Components.LotkaVolterra.Components.Predation` — Model of predation
- `Components.LotkaVolterra.Components.RegionalPopulation` — Population of animals in a specific region
- `Components.LotkaVolterra.Components.Reproduction` — Model of reproduction
- `Components.LotkaVolterra.Components.Starvation` — Model of starvation
- `Components.LotkaVolterra.ConfusingEquations.Predation` — Model of predation between two species
- `Components.LotkaVolterra.ConfusingEquations.Reproduction` — A model of reproduction
- `Components.LotkaVolterra.Examples.ClassicLotkaVolterra` [exp] — Includes reproduction, starvation and predation
- `Components.Rotational.Components.Ground` — Mechanical ground
- `Components.Rotational.Components.Inertia` — A rotational inertia model
- `Components.Rotational.Components.Inertia2` — A rotational inertia model with optional initial conditions
- `Components.Rotational.Examples.SMD` — (no description)
- `Components.Rotational.Examples.SMD_ConfigurableGear` — Use case using configurable gear in two different ways
- `Components.Rotational.Examples.SMD_GearComparison` — Use case using both grounded and ungrounded gears
- `Components.Rotational.Examples.SMD_WithBacklash` — The spring-mass-damper system with backlash
- `Components.Rotational.Examples.SMD_WithGroundedGear` — Spring mass damper system with coupled inertias and a grounded gear
- `Components.Rotational.VerboseApproach.Inertia` — Rotational inertia without inheritance
- `Components.SpeedMeasurement.Examples.Plant` [exp] — The basic plant model
- `Components.SpeedMeasurement.Examples.PlantWithIntervalMeasure` [exp] — Comparison between ideal and an interval measuring sensor
- `Components.SpeedMeasurement.Examples.PlantWithPulseCounter` [exp] — Comparison between ideal and pulse counting sensor
- `Components.SpeedMeasurement.Examples.PlantWithSampleHold` [exp] — Comparison between ideal and sample-hold sensor

## Discrete and hybrid behavior (when, events, sampling, state machines)

- `DiscreteBehavior.Accuracy.WithEvents` — Integrate with events
- `DiscreteBehavior.Accuracy.WithNoEvents` — Integrate without events
- `DiscreteBehavior.Backlash.Backlash` — Implementing the behavior of a backlash using a 'stiff spring'
- `DiscreteBehavior.BouncingBall.BouncingBall` — The 'classic' bouncing ball model
- `DiscreteBehavior.BouncingBall.StableBouncingBall` — The 'classic' bouncing ball model with numerical tolerances
- `DiscreteBehavior.Chatter.WithChatter` — (no description)
- `DiscreteBehavior.Chatter.WithoutChatter` — (no description)
- `DiscreteBehavior.CoolingRevisited.NewtonCoolingDynamic` — Cooling example with fluctuating ambient conditions
- `DiscreteBehavior.CoolingRevisited.NewtonCoolingIfExpression` — Cooling example with if expression
- `DiscreteBehavior.CoolingRevisited.NewtonCoolingMaxFunction` — Cooling example with max function
- `DiscreteBehavior.CoolingRevisited.NewtonCoolingSteadyThenDynamic` — Dynamic cooling example with steady state conditions
- `DiscreteBehavior.Counter.Counter` — Counting samples
- `DiscreteBehavior.Decay.Decay1` — (no description)
- `DiscreteBehavior.Decay.Decay2` — (no description)
- `DiscreteBehavior.Decay.Decay3` — (no description)
- `DiscreteBehavior.Decay.Decay4` — (no description)
- `DiscreteBehavior.Decay.Decay5` — (no description)
- `DiscreteBehavior.Hysteresis.ChatteringControl` — A control strategy that will 'chatter'
- `DiscreteBehavior.Hysteresis.HysteresisControl` — A control strategy that doesn't chatter
- `DiscreteBehavior.Hysteresis.HysteresisControlWithAlgorithms` — Control using algorithms
- `DiscreteBehavior.PulseGenerator.PulseGenerator` — A model that produces pulses at a fixed interval
- `DiscreteBehavior.SpeedMeasurement.CounterWithAlgorithm` — Count teeth in a given interval using an algorithm
- `DiscreteBehavior.SpeedMeasurement.IntervalMeasure` — Measure interval between teeth
- `DiscreteBehavior.SpeedMeasurement.SampleAndHold` — Measure speed and hold
- `DiscreteBehavior.SwitchedRLC.SwitchedRLC` — An RLC circuit with a switch
- `DiscreteBehavior.SynchronousSystems.HoldOperator` — Demonstrate the hold operator
- `DiscreteBehavior.SynchronousSystems.IndependentSampling` — Sampling independently
- `DiscreteBehavior.SynchronousSystems.SamplingWithClocks` — Using clocks to sub and super sample
- `DiscreteBehavior.SynchronousSystems.SubsamplingWithIntegers` — Use integers to implement subsampling
- `DiscreteBehavior.SynchronousSystems.SynchronizedSampling` — A simple way to synchronize sampling
- `DiscreteBehavior.SynchronousSystems.ZTransforms` — Using der with discrete signals

## Functions (algorithm sections, interpolation, polynomials)

- `Functions.ImpureFunctions.HysteresisEmbeddedControl` — A control strategy that uses embedded C code
- `Functions.Interpolation.IntegrateInterpolatedExternalVector` [exp] — Exercises the InterpolateExternalVector
- `Functions.Interpolation.IntegrateInterpolatedVector` [exp] — Exercises the InterpolateVector
- `Functions.Nonlinearities.ExplicitEvaluation` — Model that evaluates the quadratic function explicitly
- `Functions.Nonlinearities.ImplicitEvaluation` — Model that requires the inverse of the quadratic function
- `Functions.Polynomials.Differentiation2` — Model that differentiates a function using derivative annotation
- `Functions.Polynomials.EvaluationTest1` — Model that evaluates a polynomial

## Packages

- `PackageExamples.NestedPackages.LotkaVolterra` — Lotka-Volterra with types
- `PackageExamples.NewtonCooling` — Cooling example importing physical types from the Modelica Standard Library
- `PackageExamples.RLC` — An RLC circuit referencing types from the Modelica Standard Library
- `PackageExamples.SecondOrderSystem` — A second order rotational system importing types from Modelica Standard Library

## Subsystems (hierarchical models, replaceable parts)

- `Subsystems.GearSubsystemModel.Examples.BacklashExample` — An example demonstrating the GearWithBacklash model
- `Subsystems.GearSubsystemModel.Examples.FlatSystemWithBacklash` — An example where all components models are present at the same level
- `Subsystems.GearSubsystemModel.Examples.FlatSystemWithNoLash` — (no description)
- `Subsystems.HeatTransfer.Examples.FlatRod` — Modeling a heat transfer in a rod in a without subsystems
- `Subsystems.HeatTransfer.Examples.OneHundredSegmentRod` — Rod divided into 100 pieces
- `Subsystems.HeatTransfer.Examples.SegmentComparison` — Comparing different segmentation levels
- `Subsystems.HeatTransfer.Examples.SixSegmentRod` — Rod divided into 6 pieces
- `Subsystems.HeatTransfer.Examples.TenSegmentRod` — (no description)
- `Subsystems.HeatTransfer.Examples.ThreeSegmentRod` — Modeling a heat transfer using 3 segment rod subsystem
- `Subsystems.HeatTransfer.Examples.TwoHundredSegmentRod` — (no description)
- `Subsystems.LotkaVolterra.Components.TwoSpecies` — Lotka-Volterra two species configuration
- `Subsystems.LotkaVolterra.Examples.InitiallyDifferent` — Multiple regions with different initial populations
- `Subsystems.LotkaVolterra.Examples.UnconnectedPopulations` [exp] — Several unconnected regional populations
- `Subsystems.LotkaVolterra.Examples.WithMigration` — Connect populations by migration
- `Subsystems.Pendula.System` [exp] — A system of pendula
- `Subsystems.PowerSupply.Examples.AdditionalLoad` — A circuit with an additional transient load
- `Subsystems.PowerSupply.Examples.FlatCircuit` — A model with power source, AC-DC conversion and load in one diagram
- `Subsystems.PowerSupply.Examples.SubsystemCircuit` — Example using BasicPowerSupply subsystem

## Supporting material

- `SupportingMaterial.BaseRLC` — (no description)
- `SupportingMaterial.RotSMD` — (no description)
- `SupportingMaterial.RotSMD_WithBacklash` — Inserting a backlash element
