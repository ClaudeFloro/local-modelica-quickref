within MslCases;
model ThreeTanks_150 "Demonstrating the usage of SimpleTank"
  import Modelica.Fluid;
  extends Modelica.Icons.Example;
   // replaceable package Medium = Modelica.Fluid.Media.Water.ConstantPropertyLiquidWater extends
  // replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase extends
  // replaceable package Medium = Modelica.Media.Incompressible.Examples.Glycol47 extends
   replaceable package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater                           constrainedby 
    Modelica.Media.Interfaces.PartialMedium "Medium in the component" 
      annotation (choicesAllMatching = true);

  Modelica.Fluid.Vessels.OpenTank tank1(
    crossArea=1,
    redeclare package Medium = Medium,
    use_portsData=true,
    height=12,
    level_start=8,
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
        0.1)}) annotation (Placement(transformation(extent={{-80,20},{-40,
            60}})));
  Modelica.Fluid.Vessels.OpenTank tank2(
    crossArea=1,
    redeclare package Medium = Medium,
    use_portsData=true,
    height=12,
    level_start=3,
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
        0.1)}) annotation (Placement(transformation(extent={{-20,20},{20,
            60}})));

  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                                   annotation (Placement(transformation(
          extent={{70,-90},{90,-70}})));
  Modelica.Fluid.Vessels.OpenTank tank3(
    crossArea=1,
    redeclare package Medium = Medium,
    use_portsData=true,
    height=12,
    level_start=3,
    nPorts=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
        0.1)}) annotation (Placement(transformation(extent={{40,10},{80,
            50}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(                    redeclare package
      Medium =                                                                       Medium,
    allowFlowReversal=true,
    height_ab=2,
    length=2,
    diameter=0.1) 
                 annotation (Placement(transformation(
        origin={-60,-10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(                    redeclare package
      Medium =                                                                       Medium,
    allowFlowReversal=true,
    height_ab=2,
    length=2,
    diameter=0.1) 
                 annotation (Placement(transformation(
        origin={0,-10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(                    redeclare package
      Medium =                                                                       Medium,
    allowFlowReversal=true,
    height_ab=-1,
    length=2,
    diameter=0.1) annotation (Placement(transformation(
        origin={60,-20},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  connect(pipe1.port_a, pipe2.port_a) annotation (Line(points={{-60,-20},{-60,
          -40},{0,-40},{0,-30},{0,-20}}, color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a) annotation (Line(points={{0,-20},{0,-20},
          {0,-40},{60,-40},{60,-30}}, color={0,127,255}));
  connect(pipe3.port_b, tank3.ports[1]) 
    annotation (Line(points={{60,-10},{60,-10},{60,10}}, color={0,127,255}));
  connect(pipe1.port_b, tank1.ports[1]) annotation (Line(points={{-60,0},{-60,
          10},{-60,20}}, color={0,127,255}));
  connect(pipe2.port_b, tank2.ports[1]) annotation (Line(
      points={{0,0},{0,20}}, color={0,127,255}));

  annotation (experiment(StopTime=200),
    __Dymola_Commands(file=
          "modelica://Modelica/Resources/Scripts/Dymola/Fluid/ThreeTanks/plot level and port.m_flow.mos"
        "plot level and port.m_flow"),
    Documentation(info="<html>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/Tanks/ThreeTanks.png\" border=\"1\"
     alt=\"ThreeTanks.png\">
</html>"));
end ThreeTanks_150;
