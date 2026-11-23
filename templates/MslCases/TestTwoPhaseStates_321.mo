within MslCases;
model TestTwoPhaseStates_321 "Test the TwoPhaseWater model"
  extends Modelica.Icons.Example;
  Modelica.Media.Examples.TwoPhaseWater.ExtendedProperties medium(p(start=2000.0, fixed=true), h(start=8.0e5,
        fixed=true));
  parameter Real dh(unit="J/(kg.s)", displayUnit="kJ/(kg.s)")=80000.0 "Derivative of specific enthalpy of medium";
  parameter Real dp(unit="Pa/s", displayUnit="bar/s")=1.0e6 "Derivative of pressure of medium";
equation
  der(medium.p) = dp;
  der(medium.h) = dh;
  annotation (experiment(StopTime=22, Interval=0.01), Documentation(info="<html>
<p> For details see the documentation of the example package TwoPhaseWater</p>
</html>"));
end TestTwoPhaseStates_321;
