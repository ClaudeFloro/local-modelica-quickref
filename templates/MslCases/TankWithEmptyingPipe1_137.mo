within MslCases;
model TankWithEmptyingPipe1_137
  "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;

  Modelica.Fluid.Sources.MassFlowSource_T flowSource(
    nPorts=1,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow=50,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                        annotation (Placement(transformation(extent={{-100,60},
            {-80,80}})));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed(nPorts=1,
                                         redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
                                            redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 1,
    m_flow_nominal=100) 
    annotation (Placement(transformation(
        origin={-20,-50},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.BooleanConstant open(k=false) 
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank1(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    crossArea=1,
    V0=0.1,
    height=2,
    level_start=0.1,
    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.05, height=0),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
                                                        diameter=0.1,
        height=1)},
    stiffCharacteristicForEmptyPort=true) 
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=1) annotation (Placement(transformation(
        origin={40,10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  connect(ambient_fixed.ports[1], valveDiscrete.port_a) annotation (Line(points={
          {-40,-90},{-20,-90},{-20,-60}}, color={0,127,255}));
  connect(open.y, valveDiscrete.open) annotation (Line(points={{-39,-50},{-28,
          -50}}, color={255,0,255}));
  connect(flowSource.ports[1], pipe.port_b) annotation (Line(points={{0,50},{40,
          50},{40,20}}, color={0,127,255}));
  connect(valveDiscrete.port_b, tank1.ports[1]) annotation (Line(points={{-20,-40},
          {-20,-30},{-20,-21},{-22,-21}}, color={0,127,255}));
  connect(pipe.port_a, tank1.ports[2]) annotation (Line(points={{40,0},{40,-28},
          {-18,-28},{-18,-20},{-18,-21}}, color={0,127,255}));
  annotation (experiment(StopTime=35));
end TankWithEmptyingPipe1_137;
