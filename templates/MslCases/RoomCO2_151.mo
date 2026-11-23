within MslCases;
model RoomCO2_151 "Demonstrates a room volume with CO2 accumulation"
  extends Modelica.Icons.Example;
  package Medium=Modelica.Media.Air.MoistAir(extraPropertiesNames={"CO2"},
                                             C_nominal={1.519E-3});
  Modelica.Blocks.Sources.Constant C(k=0.3*1.519E-3)
    "Substance concentration, raising to 1000 PPM CO2" 
    annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
  Modelica.Fluid.Sources.FixedBoundary boundary4(nPorts=1,redeclare package Medium = Medium) 
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  Modelica.Fluid.Sensors.TraceSubstances traceVolume(redeclare package Medium = Medium) 
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) 
                                   annotation (Placement(transformation(extent={{52,36},
            {72,56}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    use_C_in=true,
    m_flow=100/1.2/3600*5,
    redeclare package Medium = Medium,
    nPorts=2,
    X=Medium.X_default) 
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    C_start={1.519E-3},
    V=100,
    redeclare package Medium = Medium,
    nPorts=2,
    X_start={0.015,0.085},
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    use_portsData=false) 
              annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.15,
    redeclare model FlowModel =
        Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow (
         show_Res=true)) 
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Fluid.Sensors.TraceSubstances traceSource(redeclare package Medium = Medium) 
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(C.y, boundary1.C_in[1]) annotation (Line(
      points={{-73,-18},{-60,-18}}, color={0,0,127}));
  connect(pipe.port_b, boundary4.ports[1]) annotation (Line(
      points={{40,-10},{60,-10}}, color={0,127,255}));
  connect(volume.ports[2], pipe.port_a) annotation (Line(
      points={{-8,0},{-8,-10},{20,-10}}, color={0,127,255}));
  connect(traceVolume.port, pipe.port_a) annotation (Line(
      points={{10,20},{10,-10},{20,-10}}, color={0,127,255}));
  connect(boundary1.ports[2], volume.ports[1]) annotation (Line(
      points={{-40,-10.5},{-12,-10.5},{-12,0}}, color={0,127,255}));
  connect(boundary1.ports[1], traceSource.port) annotation (Line(
      points={{-40,-9.5},{-30,-9.5},{-30,20}}, color={0,127,255}));
  annotation (
    experiment(StopTime=3600),
    Documentation(info="<html>
<p>
This example consists of a volume with a carbon dioxide concentration that corresponds to
1.519E-3 kg/kg, which is equal to 1000 PPM.
There is a fresh air stream with a carbon dioxide concentration of about 300 PPM.
The fresh air stream is such that the air exchange rate is about 5 air changes per hour.
After 1 hour of ventilation, the volume's carbon dioxide concentration is close to the
concentration of the fresh air.
</p>
<p>
The nominal value for the trace substance is set to <code>C_nominal={1.519E-3}</code>.
This scales the residual equations that are used by the solver to the right order
of magnitude.
</p>
<div>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/TraceSubstances/RoomCO2.png\" border=\"1\"
     alt=\"RoomCO2.png\">
</div>
</html>"),
    __Dymola_Commands(file(ensureSimulated=true)=
        "modelica://Modelica/Resources/Scripts/Dymola/Fluid/RoomCO2/plotConcentrations.mos"
        "plot concentrations"));
end RoomCO2_151;
