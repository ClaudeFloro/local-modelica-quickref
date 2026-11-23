within MslCases;
model OneTank_136
  "Tank with one time-varying top inlet mass flow rate and a bottom outlet into the ambient"
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;

  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    crossArea=1,
    height=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.1, height=0)},
    V0=0.1,
    nTopPorts=1,
    nPorts=1,
    level_start=0.8,
    stiffCharacteristicForEmptyPort=false,
    hysteresisFactor=0.01) 
    annotation (Placement(transformation(extent={{0,0},{40,40}})));

  Modelica.Fluid.Sources.MassFlowSource_T flowSource(nPorts=1,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow=20,
    T=system.T_ambient,
    use_m_flow_in=true) 
    annotation (Placement(transformation(extent={{-12,42},{8,62}})));
  inner Modelica.Fluid.System system 
                        annotation (Placement(transformation(extent={{70,72},
            {90,92}})));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed(nPorts=1,
                                         redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=1,
    diameter=0.1,
    height_ab=-1) 
                 annotation (Placement(transformation(
        origin={20,-18},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 10,0; 10,40; 20,40;
        20,10; 50,10; 50,0; 60,0; 60,20; 70,20; 80,55; 80,0; 100,0]) 
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
equation
  connect(flowSource.ports[1], tank.topPorts[1]) annotation (Line(points={{8,52},{
          20,52},{20,41}}, color={0,127,255}));
  connect(tank.ports[1], pipe.port_a) annotation (Line(
      points={{20,-1},{20,-8}}, color={0,127,255}));
  connect(pipe.port_b, ambient_fixed.ports[1]) annotation (Line(
      points={{20,-28},{20,-40},{6,-40}}, color={0,127,255}));
  connect(timeTable.y, flowSource.m_flow_in) annotation (Line(
      points={{-39,70},{-24,70},{-24,60},{-12,60}}, color={0,0,127}));
  annotation (experiment(StopTime=100));
end OneTank_136;
