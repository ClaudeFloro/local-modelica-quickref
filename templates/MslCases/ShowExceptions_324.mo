within MslCases;
model ShowExceptions_324
    "Example to demonstrate how a hierarchically structured StateGraph can suspend and resume actions on different levels"

  extends Modelica.Icons.Example;

  Modelica.StateGraph.Examples.Utilities.CompositeStep1 compositeStep annotation (Placement(transformation(extent={{
              -20,25},{10,55}})));
  Modelica.StateGraph.InitialStep initialStep(nIn=1, nOut=1) annotation (
        Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.StateGraph.Transition transition1(enableTimer=true, waitTime=1) 
    annotation (Placement(
          transformation(extent={{-50,30},{-30,50}})));
  Modelica.StateGraph.Transition transition2(enableTimer=true, waitTime=1) 
    annotation (Placement(
          transformation(extent={{20,30},{40,50}})));
  Modelica.StateGraph.Transition transition3(enableTimer=true, waitTime=2) 
    annotation (Placement(
          transformation(extent={{-55,-30},{-35,-10}})));
  Modelica.StateGraph.Step step1(nIn=1, nOut=1) annotation (Placement(transformation(extent={{-24,-30},{-4,-10}})));
  Modelica.StateGraph.Transition transition4(enableTimer=true, waitTime=1) 
    annotation (Placement(
          transformation(extent={{10,-30},{30,-10}})));
    inner Modelica.StateGraph.StateGraphRoot stateGraphRoot 
      annotation (Placement(transformation(extent={{-90,-80},{-70,-60}})));
equation

  connect(transition1.outPort, compositeStep.inPort) 
    annotation (Line(points={{-38.5,40},{-21,40}}));
  connect(initialStep.outPort[1], transition1.inPort) 
    annotation (Line(points={{-59.5,40},{-44,40}}));
  connect(compositeStep.outPort, transition2.inPort) 
    annotation (Line(points={{10.5,40},{26,40}}));
  connect(transition2.outPort, initialStep.inPort[1]) annotation (Line(points=
           {{31.5,40},{46,40},{46,80},{-90,80},{-90,40},{-81,40}}));
  connect(compositeStep.suspend[1], transition3.inPort) 
                                                annotation (Line(points={{-12.5,
            24.5},{-12.5,10},{-60,10},{-60,-20},{-49,-20}}));
  connect(transition3.outPort, step1.inPort[1]) annotation (Line(points={{
            -43.5,-20},{-25,-20}}));
  connect(step1.outPort[1], transition4.inPort) 
    annotation (Line(points={{-3.5,-20},{16,-20}}));
  connect(transition4.outPort, compositeStep.resume[1]) 
                                                annotation (Line(points={{21.5,
            -20},{40,-20},{40,10},{2.5,10},{2.5,24}}));
  annotation (
    Documentation(info="<html>
<p>
CompositeStep \"compositeStep\" is a hierarchical StateGraph consisting of
two other subgraphs. Whenever component \"compositeStep\" is suspended,
all steps with in \"compositeStep\" are deactivated. By entering \"compositeStep\"
via its \"resume\" port, all steps within \"compositeStep\" are activated
according to their setting before leaving the \"compositeStep\" via its
\"suspend\" port.
</p>
</html>"),experiment(StopTime=20));
end ShowExceptions_324;
