within MslCases;
model Inverse_sh_TX_313
  "Solve h = h_pTX(p, T, X), s = s_pTX(p, T, X) for T, if h or s is given"
  extends Modelica.Icons.Example;

  import Medium = Modelica.Media.Air.ReferenceMoistAir "Medium model";

  parameter Modelica.Units.SI.Temperature T_min=300
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Temperature T_max=500
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Pressure p=1.0e5 "Fixed pressure in model";
  parameter Modelica.Units.SI.MassFraction[:] X=Modelica.Media.Air.ReferenceMoistAir.reference_X
    "Mass fraction vector";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_min=
      Modelica.Media.Air.ReferenceMoistAir.specificEnthalpy(
      Modelica.Media.Air.ReferenceMoistAir.setState_pTX(
            p,
            T_min,
            X)) "Specific enthalpy at T_min";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_max=
      Modelica.Media.Air.ReferenceMoistAir.specificEnthalpy(
      Modelica.Media.Air.ReferenceMoistAir.setState_pTX(
            p,
            T_max,
            X)) "Specific enthalpy at T_max";
  final parameter Modelica.Units.SI.SpecificEntropy s_min=
      Modelica.Media.Air.ReferenceMoistAir.specificEntropy(
      Modelica.Media.Air.ReferenceMoistAir.setState_pTX(
            p,
            T_min,
            X)) "Specific entropy at T_min";
  final parameter Modelica.Units.SI.SpecificEntropy s_max=
      Modelica.Media.Air.ReferenceMoistAir.specificEntropy(
      Modelica.Media.Air.ReferenceMoistAir.setState_pTX(
            p,
            T_max,
            X)) "Specific entropy at T_max";
  Modelica.Units.SI.SpecificEnthalpy h1 "Pre-defined specific enthalpy";
  Modelica.Units.SI.SpecificEnthalpy h2
    "Specific enthalpy computed from T (= h1 required)";
  Modelica.Units.SI.SpecificEntropy s1 "Pre-defined specific entropy";
  Modelica.Units.SI.SpecificEntropy s2
    "Specific entropy computed from T (= h1 required)";
  Modelica.Units.SI.Temperature Th "Temperature computed from h1";
  Modelica.Units.SI.Temperature Ts "Temperature computed from s1";

protected
  constant Modelica.Units.SI.Time timeUnit=1.0;

equation
  // Define specific enthalpy
  h1 = if time < 0 then h_min else if time >= 1 then h_max else h_min + time
    /timeUnit*(h_max - h_min);
  s1 = if time < 0 then s_min else if time >= 1 then s_max else s_min + time
    /timeUnit*(s_max - s_min);

  // Solve for temperature
  Th = Medium.temperature_phX(
          p,
          h1,
          X);
  Ts = Medium.temperature_psX(
          p,
          s1,
          X);

  // Check (h2 must be identical to h1)
  h2 = Medium.specificEnthalpy_pTX(
          p,
          Th,
          X);
  s2 = Medium.specificEntropy_pTX(
          p,
          Ts,
          X);
  assert(abs(h1 - h2) < 1e-3, "Inverse for h not correctly computed");
  assert(abs(s1 - s2) < 1e-3, "Inverse for s not correctly computed");

  annotation (experiment(StopTime=1), Documentation(info="<html>

</html>"));
end Inverse_sh_TX_313;
