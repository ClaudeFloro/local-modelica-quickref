within MslCases;
model TankWithEmptyingPipe2_138
  "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;

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
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank1(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    crossArea=1,
    V0=0.1,
    height=2,
    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.05, height=0),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
                                                        diameter=0.1,
        height=1)},
    level_start=2,
    stiffCharacteristicForEmptyPort=true) 
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=1) annotation (Placement(transformation(
        origin={-20,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));

  Modelica.Fluid.Pipes.StaticPipe pipe2(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=1) annotation (Placement(transformation(
        origin={30,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed1(nPorts=1,
                                         redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
equation
  connect(tank1.ports[1], pipe1.port_b) annotation (Line(points={{-22,-21},{
          -22,-35},{-20,-35},{-20,-50}}, color={0,127,255}));
  connect(ambient_fixed.ports[1], pipe1.port_a) annotation (Line(points={{-40,-90},
          {-20,-90},{-20,-70}}, color={0,127,255}));
  connect(tank1.ports[2], pipe2.port_b) annotation (Line(points={{-18,-21},{
          -18,-21},{-18,-40},{30,-40},{30,-50}}, color={0,127,255}));
  connect(ambient_fixed1.ports[1], pipe2.port_a) annotation (Line(points={{20,-90},
          {30,-90},{30,-70}}, color={0,127,255}));
  annotation (experiment(StopTime=120));
end TankWithEmptyingPipe2_138;
