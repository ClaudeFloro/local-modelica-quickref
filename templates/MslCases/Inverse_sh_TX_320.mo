within MslCases;
model Inverse_sh_TX_320
  "Solve h = h_TX(TX) for T, if h is given for ideal gas NASA"
  extends Modelica.Icons.Example;

  replaceable package Medium =
      Modelica.Media.IdealGases.MixtureGases.FlueGasLambdaOnePlus 
    constrainedby Modelica.Media.IdealGases.Common.MixtureGasNasa
    "Medium model" annotation (choicesAllMatching=true);

  parameter Modelica.Units.SI.Temperature T_min=300
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Temperature T_max=500
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Pressure p=1.0e5 "Fixed pressure in model";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_min=Medium.h_TX(T_min, X)
    "Specific enthalpy at T_min";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_max=Medium.h_TX(T_max, X)
    "Specific enthalpy at T_max";
  final parameter Modelica.Units.SI.SpecificEntropy s_min=Medium.specificEntropy(
    Medium.setState_pTX(p, T_min, Medium.reference_X)) "Specific entropy at T_min";
  final parameter Modelica.Units.SI.SpecificEntropy s_max=Medium.specificEntropy(
    Medium.setState_pTX(p, T_max, Medium.reference_X)) "Specific entropy at T_max";
  Modelica.Units.SI.SpecificEnthalpy h1(start=h_min, fixed=true)
    "Pre-defined specific enthalpy";
  Modelica.Units.SI.SpecificEnthalpy h2
    "Specific enthalpy computed from Th (= h1 required)";
  Modelica.Units.SI.SpecificEntropy s1(start=s_min, fixed=true)
    "Pre-defined specific entropy";
  Modelica.Units.SI.SpecificEntropy s2 "Specific entropy computed from Ts (= s1 required)";
  Modelica.Units.SI.Temperature Th "Temperature computed from h1";
  Modelica.Units.SI.Temperature Ts "Temperature computed from s1";
  parameter Modelica.Units.SI.MassFraction[4] X=Medium.reference_X "Mass fraction vector";

protected
  constant Modelica.Units.SI.Time timeUnit=1.0;

equation
  // Define specific enthalpy and specific entropy
  der(h1) = if time < 1.0 then 1/timeUnit*(h_max - h_min) else 0.0;
  der(s1) = if time < 1.0 then 1/timeUnit*(s_max - s_min) else 0.0;

  // Solve for temperatures
  Th = Medium.temperature_phX(p, h1, X);
  Ts = Medium.temperature_psX(p, s1, X);

  // Check (h2 must be identical to h1, s2 must be identical to s1)
  h2 = Medium.specificEnthalpy_pTX(p, Th, X);
  s2 = Medium.specificEntropy(Medium.setState_pTX(p, Ts, X));
  annotation (experiment(StopTime=1), Documentation(info="<html>
<p>
This models computes the temperature <code>Th</code> for predefined specific enthalpy <code>h1</code> via numerical inversion of function <a href=\"modelica://Modelica.Media.IdealGases.Common.Functions.h_T\">Modelica.Media.IdealGases.Common.Functions.h_T</a>.
The specific enthalpy <code>h2</code> is computed as check variable from temperature <code>Th</code> and must be identical to <code>h1</code>.
</p>

<p>
In an analogous manner, the temperature <code>Ts</code> is computed for predefined specific entropy <code>s1</code> via numerical inversion of function <a href=\"modelica://Modelica.Media.IdealGases.Common.Functions.s0_T\">Modelica.Media.IdealGases.Common.Functions.s0_T</a>.
The specific entropy <code>s2</code> is computed as check variable from temperature <code>Ts</code> and must be identical to <code>s1</code>.
</p>

<p>
The numerical computation of the inverse function is performed by function <a href=\"modelica://Modelica.Math.Nonlinear.solveOneNonlinearEquation\">Modelica.Math.Nonlinear.solveOneNonlinearEquation</a> in both cases.
</p>

</html>"));
end Inverse_sh_TX_320;
