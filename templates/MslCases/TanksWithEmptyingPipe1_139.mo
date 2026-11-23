within MslCases;
model TanksWithEmptyingPipe1_139
  "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;

  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                        annotation (Placement(transformation(extent={{-100,60},
            {-80,80}})));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed1(nPorts=1,
                                          redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
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
    annotation (Placement(transformation(extent={{-80,0},{-40,40}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=1) annotation (Placement(transformation(
        origin={-60,-40},
        extent={{-10,-10},{10,10}},
        rotation=90)));

  Modelica.Fluid.Pipes.StaticPipe pipe2(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=1) annotation (Placement(transformation(
        origin={40,-40},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed2(nPorts=1,
                                         redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank2(
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
        height=0.5)},
    level_start=0.1,
    stiffCharacteristicForEmptyPort=true) 
    annotation (Placement(transformation(extent={{20,0},{60,40}})));
  Modelica.Fluid.Pipes.StaticPipe pipe3(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=-0.5) 
                 annotation (Placement(transformation(extent={{-20,10},{0,30}})));
equation
  connect(tank1.ports[1], pipe1.port_b) annotation (Line(points={{-62,-1},{
          -62,-15},{-60,-15},{-60,-30}}, color={0,127,255}));
  connect(ambient_fixed1.ports[1], pipe1.port_a) 
                                            annotation (Line(points={{-80,-70},
          {-60,-70},{-60,-50}}, color={0,127,255}));
  connect(ambient_fixed2.ports[1], pipe2.port_a) annotation (Line(points={{20,-70},
          {40,-70},{40,-50}}, color={0,127,255}));
  connect(tank2.ports[1], pipe2.port_b) 
    annotation (Line(points={{38,-1},{38,-15},{40,-15},{40,-30}}, color={0,127,255}));
  connect(pipe3.port_a, tank1.ports[2]) annotation (Line(points={{-20,20},{
          -30,20},{-30,-10},{-58,-10},{-58,0},{-58,0},{-58,-1}}, color={0,127,
          255}));
  connect(pipe3.port_b, tank2.ports[2]) annotation (Line(points={{0,20},{10,
          20},{10,-8},{38,-8},{38,0},{42,0},{42,-1}}, color={0,127,255}));
  annotation (experiment(StopTime=120));
end TanksWithEmptyingPipe1_139;
