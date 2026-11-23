within MslCases;
model Inverse_sh_T_312
  "Solve h = h_pT(p, T), s = s_pT(p, T) for T, if h or s is given"
  extends Modelica.Icons.Example;

  import Medium = Modelica.Media.Air.ReferenceAir.Air_pT "Medium model";

  parameter Modelica.Units.SI.Temperature T_min=300
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Temperature T_max=500
    "Vary temperature linearly from T_min (time=0) up to T_max (time=1)";
  parameter Modelica.Units.SI.Pressure p=1.0e5 "Fixed pressure in model";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_min=
      Medium.specificEnthalpy(Medium.setState_pT(p, T_min))
    "Specific enthalpy at T_min";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_max=
      Medium.specificEnthalpy(Medium.setState_pT(p, T_max))
    "Specific enthalpy at T_max";
  final parameter Modelica.Units.SI.SpecificEntropy s_min=
      Medium.specificEntropy(Medium.setState_pT(p, T_min))
    "Specific entropy at T_min";
  final parameter Modelica.Units.SI.SpecificEntropy s_max=
      Medium.specificEntropy(Medium.setState_pT(p, T_max))
    "Specific entropy at T_max";
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
  // Define specific enthalpy and specific entropy
  h1 = if time < 0 then h_min else if time >= 1 then h_max else h_min + time
    /timeUnit*(h_max - h_min);
  s1 = if time < 0 then s_min else if time >= 1 then s_max else s_min + time
    /timeUnit*(s_max - s_min);

  // Solve for temperature
  Th = Medium.temperature_phX(
          p,
          h1,
          fill(0.0, 0));
  Ts = Medium.temperature_psX(
          p,
          s1,
          fill(0.0, 0));

  // Check (h2 must be identical to h1)
  h2 = Medium.specificEnthalpy_pTX(
          p,
          Th,
          fill(0.0, 0));
  s2 = Medium.specificEntropy_pTX(
          p,
          Ts,
          fill(0, 0));
  assert(abs(h1 - h2) < 1e-3, "Inverse for h not correctly computed");
  assert(abs(s1 - s2) < 1e-3, "Inverse for s not correctly computed");
  annotation (experiment(StopTime=1));
end Inverse_sh_T_312;
