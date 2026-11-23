within MslCases;
model TwoTanks_141
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;
  parameter Boolean stiffCharacteristicForEmptyPort=true
    "= true, if steep pressure loss characteristic for empty pipe port";

  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                        annotation (Placement(transformation(extent={{40,62},
            {60,82}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank1(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    stiffCharacteristicForEmptyPort = stiffCharacteristicForEmptyPort,
    crossArea=1,
    height=4,
    level_start=3,
    T_start=Modelica.Units.Conversions.from_degC(50),
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.1, height=0)}) 
    annotation (Placement(transformation(extent={{-80,0},{-40,40}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank2(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    stiffCharacteristicForEmptyPort = stiffCharacteristicForEmptyPort,
    crossArea=1,
    height=4,
    level_start=1,
    T_start=Modelica.Units.Conversions.from_degC(100),
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.1, height=0)}) 
    annotation (Placement(transformation(extent={{0,0},{40,40}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1) annotation (Placement(transformation(extent={{-30,-30},{
            -10,-10}})));
equation
  connect(tank1.ports[1], pipe.port_a) annotation (Line(points={{-60,-1},{-60,
          -20},{-30,-20}}, color={0,127,255}));
  connect(pipe.port_b, tank2.ports[1]) annotation (Line(points={{-10,-20},{20,
          -20},{20,-1}}, color={0,127,255}));
  annotation (experiment(StopTime=100));
end TwoTanks_141;
