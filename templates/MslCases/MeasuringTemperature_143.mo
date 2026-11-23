within MslCases;
model MeasuringTemperature_143 "Differences between using one port with and without explicit junction model and two port sensors for fluid temperature measuring"
   extends Modelica.Icons.Example;
  Modelica.Fluid.Sensors.Temperature T_onePort(redeclare package Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_twoPort(redeclare package
      Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                                      annotation (Placement(transformation(
          extent={{-100,56},{-80,76}})));
  Modelica.Fluid.Vessels.OpenTank openTankCold2(nPorts=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    level_start=0.975,
    T_start=293.15) annotation (Placement(transformation(extent={{20,6},{
            40,26}})));
  Modelica.Fluid.Vessels.OpenTank openTankCold1(
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    nPorts=1,
    level_start=0.975,
    T_start=293.15) annotation (Placement(transformation(extent={{20,60},
            {40,80}})));
  Modelica.Fluid.Vessels.OpenTank openTankHot1(nPorts=1,
    level_start=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    T_start=353.15) annotation (Placement(transformation(extent={{60,40},
            {80,60}})));
  Modelica.Fluid.Vessels.OpenTank openTankHot2(nPorts=1,
    level_start=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    T_start=353.15) annotation (Placement(transformation(extent={{60,-10},
            {80,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T mFlow1(
    nPorts=1,
        medium(sat(psat(start = 1e5))),
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    use_m_flow_in=true,
    use_T_in=false,
    T=323.15) annotation (Placement(transformation(extent=
           {{-60,30},{-40,50}})));
  Modelica.Fluid.Sources.MassFlowSource_T mFlow2(
    nPorts=1,
        medium(sat(psat(start = 1e5))),
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    use_m_flow_in=true,
    T=323.15) annotation (Placement(transformation(extent=
           {{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Sine sine(f=1) 
                                    annotation (Placement(transformation(extent=
           {{-100,10},{-80,30}})));
  Modelica.Fluid.Sensors.Temperature T_junction(redeclare package Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Fluid.Vessels.OpenTank openTankCold3(nPorts=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    level_start=0.975,
    T_start=293.15) annotation (Placement(transformation(extent={{20,-60},
            {40,-40}})));
  Modelica.Fluid.Vessels.OpenTank openTankHot3(nPorts=1,
    level_start=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    height=2,
    crossArea=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    T_start=353.15) annotation (Placement(transformation(extent={{60,-80},
            {80,-60}})));
  Modelica.Fluid.Sources.MassFlowSource_T mFlow3(
    nPorts=1,
        medium(sat(psat(start = 1e5))),
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    use_m_flow_in=true,
    T=323.15) annotation (Placement(transformation(extent=
           {{-60,-90},{-40,-70}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal junctionIdeal(
                                                       redeclare package
      Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
equation
  connect(mFlow2.ports[1], T_twoPort.port_a) annotation (Line(
      points={{-40,-10},{-20,-10}}, color={0,127,255}));
  connect(mFlow1.ports[1], T_onePort.port) annotation (Line(
      points={{-40,40},{-10,40}}, color={0,127,255}));
  connect(sine.y, mFlow1.m_flow_in) annotation (Line(
      points={{-79,20},{-70,20},{-70,48},{-60,48}}, color={0,0,127}));
  connect(sine.y, mFlow2.m_flow_in) annotation (Line(
      points={{-79,20},{-70,20},{-70,-2},{-60,-2}}, color={0,0,127}));
  connect(mFlow3.ports[1], T_junction.port) annotation (Line(
      points={{-40,-80},{-10,-80}}, color={0,127,255}));
  connect(sine.y, mFlow3.m_flow_in) annotation (Line(
      points={{-79,20},{-70,20},{-70,-72},{-60,-72}}, color={0,0,127}));
  connect(T_junction.port, junctionIdeal.port_1) annotation (Line(
      points={{-10,-80},{20,-80}}, color={0,127,255}));
  connect(T_twoPort.port_b, openTankCold2.ports[1]) annotation (Line(
        points={{0,-10},{0,-10},{30,-10},{30,6}}, color={0,127,255}));
  connect(T_onePort.port, openTankHot1.ports[1]) annotation (Line(
        points={{-10,40},{-10,40},{70,40}}, color={0,127,255}));
  connect(T_twoPort.port_b, openTankHot2.ports[1]) annotation (Line(
        points={{0,-10},{30,-10},{70,-10}}, color={0,127,255}));
  connect(junctionIdeal.port_3, openTankCold3.ports[1]) annotation (Line(points={{30,-70},
          {30,-65},{30,-60}}, color={0,127,255}));
  connect(junctionIdeal.port_2, openTankHot3.ports[1]) annotation (Line(points={{40,-80},
          {55.5,-80},{70,-80}}, color={0,127,255}));
  connect(T_onePort.port, openTankCold1.ports[1]) annotation (Line(
      points={{-10,40},{30,40},{30,60}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
            -100},{100,100}}), graphics={
        Text(
          extent={{42,52},{62,46}},
          textString="T=80"),
        Text(
          extent={{-4,76},{18,70}},
          textString="T=20"),
        Text(
          extent={{-62,20},{-36,12}},
          textString="T=50")}),
                       Documentation(info="<html>
<p>
This model demonstrates the differences that occur when using
one- and two-port temperature sensors with and without explicit junction models.
As shown in the next figure, the same system is shown in 3 different variations.
In all cases exactly the same fluid system is defined. The only difference is
how the temperature is measured:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/Explanatory/MeasuringTemperature1.png\"
     alt=\"MeasuringTemperature1.png\">
</blockquote>

<p>
A pre-defined mass flow rate is present so that fluid flows from the reservoir to the
tanks and after 0.5 s the mass flows from the tanks to the reservoir.
The reservoir has a temperature of 50<sup>0</sup>C whereas the tanks have an
initial temperature of 20<sup>0</sup>C and of 80<sup>0</sup>C. The initial height of the
tanks is made in such a form that fluid always flows out of the cold tank.
When the fluid flows from the reservoir to the tanks, then it mixes with the
cold tank and enters the hot tank.
When the fluid flow from the tanks to the reservoir, then the cold and hot water
from the two tanks first mixes and the flows to the reservoir.
</p>

<p>
A one-port sensor measures the <em>mixing</em> temperature at a connection point.
Therefore T_onePort.T (the blue curve in the figure below) is the
temperature of the mixing point.
A two-port sensor measures the temperature at the <em>upstream</em> side.
Therefore T_twoPort.T (the red curve in the figure below which is identical
to the green curve) shows first the temperature of the reservoir and then
the mixing temperature when fluid flows from the tanks to the reservoir.
The same is measured with T_junction.T (the green curve below), because
the one-port sensor is connected between the mass flow source and the junction
and since the mixing takes place in the junction, the same situation is
present as for T_twoPort.T.
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/Explanatory/MeasuringTemperature2.png\"
     alt=\"MeasuringTemperature2.png\">
</blockquote>

</html>"),
    experiment(StopTime=1.1));
end MeasuringTemperature_143;
