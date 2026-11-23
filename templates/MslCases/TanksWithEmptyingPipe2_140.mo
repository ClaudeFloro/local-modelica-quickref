within MslCases;
model TanksWithEmptyingPipe2_140
  "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
  parameter Boolean stiffCharacteristicForEmptyPort=true
    "= true, if steep pressure loss characteristic for empty pipe port";
  import Modelica.Units.Conversions.from_bar;
  extends Modelica.Icons.Example;
  replaceable package Medium =
     Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby 
    Modelica.Media.Interfaces.PartialMedium "Medium in the component" 
      annotation (choicesAllMatching = true);

  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                        annotation (Placement(transformation(extent={{-100,60},
            {-80,80}})));
  Modelica.Fluid.Sources.Boundary_pT ambient_fixed(nPorts=1,
                                         redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=system.p_ambient,
    T=system.T_ambient) 
    annotation (Placement(transformation(extent={{-16,-102},{-36,-82}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
                                            redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 1,
    m_flow_nominal=100) 
    annotation (Placement(transformation(
        origin={-60,-78},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.BooleanConstant open(k=false) 
    annotation (Placement(transformation(extent={{-98,-88},{-78,-68}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank3(
    redeclare package Medium = Medium,
    crossArea=1,
    V0=0.1,
    height=20,
    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.05, height=0),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
          diameter=0.05,
          height=6.5)},
    level_start=6,
    nTopPorts=1,
    stiffCharacteristicForEmptyPort = stiffCharacteristicForEmptyPort) 
    annotation (Placement(transformation(extent={{-80,-50},{-40,-10}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank1(
    redeclare package Medium = Medium,
    crossArea=1,
    V0=0.1,
    height=10,
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.1, height=0)},
    level_start=9,
    stiffCharacteristicForEmptyPort = stiffCharacteristicForEmptyPort) 
    annotation (Placement(transformation(extent={{50,50},{90,90}})));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank2(
    redeclare package Medium = Medium,
    crossArea=1,
    V0=0.1,
    height=10,
    nPorts=3,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.05, height=0),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
                                                        diameter=0.05,
        height=2),Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.1, height=3)},
    level_start=1,
    stiffCharacteristicForEmptyPort = stiffCharacteristicForEmptyPort) 
    annotation (Placement(transformation(extent={{-20,10},{20,50}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(         redeclare package Medium = Medium,
      height_ab=2,
    length=2,
    diameter=0.1) annotation (Placement(transformation(
        origin={70,30},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium,
      height_ab=2,
    length=2,
    diameter=0.1) annotation (Placement(transformation(
        origin={0,-22},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium,
      height_ab=2,
    length=2,
    diameter=0.1) annotation (Placement(transformation(
        origin={-60,10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  connect(ambient_fixed.ports[1], valveDiscrete.port_a) annotation (Line(points={
          {-36,-92},{-60,-92},{-60,-88}}, color={0,127,255}));
  connect(open.y, valveDiscrete.open) annotation (Line(points={{-77,-78},{-68,
          -78}}, color={255,0,255}));
  connect(valveDiscrete.port_b,tank3. ports[1]) annotation (Line(points={{-60,-68},
          {-60,-59},{-60,-51},{-62,-51}}, color={0,127,255}));
  connect(pipe1.port_b, tank1.ports[1]) annotation (Line(points={{70,40},{
          70,45},{70,49}}, color={0,127,255}));
  connect(pipe2.port_a, tank3.ports[2]) annotation (Line(points={{
          0,-32},{0,-48},{0,-60},{-58,-60},{-58,-51}}, color={0,127,255}));
  connect(pipe3.port_a, tank3.topPorts[1]) 
                                          annotation (Line(points={{-60,0},
          {-60,-5},{-60,-9}}, color={0,127,255}));
  connect(pipe3.port_b, tank2.ports[1]) annotation (Line(points={{-60,20},{
          -60,26},{-30,26},{-30,0},{-2,0},{-2,9},{-2.66667,9}}, color={0,127,255}));
  connect(pipe1.port_a, tank2.ports[3]) annotation (Line(points={{70,20},{
          70,0},{2,0},{2,9},{2.66667,9}}, color={0,127,255}));
  connect(pipe2.port_b, tank2.ports[2]) annotation (Line(
      points={{0,-12},{0,9}}, color={0,127,255}));
  annotation (experiment(StopTime=120));
end TanksWithEmptyingPipe2_140;
