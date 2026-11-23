within MslCases;
model MixtureGases_305 "Test gas mixtures"
  extends Modelica.Icons.Example;

  parameter Modelica.Units.SI.Volume V=1 "Fixed size of volume 1 and volume 2";
  parameter Modelica.Units.SI.MassFlowRate m_flow_ext=0.01
    "Fixed mass flow rate into volume 1 and into volume 2";
  parameter Modelica.Units.SI.EnthalpyFlowRate H_flow_ext=5000
    "Fixed enthalpy flow rate into volume 1 and into volume 2";

  package Medium1 = Modelica.Media.IdealGases.MixtureGases.CombustionAir
    "Medium model";
  Medium1.BaseProperties medium1(
    p(start=1.e5,
      fixed=true,
      stateSelect=StateSelect.prefer),
    T(start=300,
      fixed=true,
      stateSelect=StateSelect.prefer),
    X(start={0.8,0.2}));
  Real m1(quantity=Medium1.mediumName, start=1.0);
  Modelica.Units.SI.InternalEnergy U1;
  Medium1.SpecificHeatCapacity cp1=Medium1.specificHeatCapacityCp(medium1.state);
  Medium1.DynamicViscosity eta1=Medium1.dynamicViscosity(medium1.state);
  Medium1.ThermalConductivity lambda1=Medium1.thermalConductivity(medium1.state);

  package Medium2 = Modelica.Media.IdealGases.MixtureGases.SimpleNaturalGas
    "Medium model";
  Medium2.BaseProperties medium2(
    p(start=1.e5,
      fixed=true,
      stateSelect=StateSelect.prefer),
    T(start=300,
      fixed=true,
      stateSelect=StateSelect.prefer),
    X(start={0.1,0.1,0.1,0.2,0.2,0.3}));
  Real m2(quantity=Medium2.mediumName, start=1.0);
  Modelica.Units.SI.InternalEnergy U2;
  Medium2.SpecificHeatCapacity cp2=Medium2.specificHeatCapacityCp(medium2.state);
  Medium2.DynamicViscosity eta2=Medium2.dynamicViscosity(medium2.state);
  Medium2.ThermalConductivity lambda2=Medium2.thermalConductivity(medium2.state);

  Medium2.ThermodynamicState state2=Medium2.setState_pTX(
          1.005e5,
          302,
          {0.3,0.2,0.2,0.1,0.1,0.1});
  Medium2.ThermodynamicState smoothState;
  Real m_flow_ext2;
  Real der_p;
  Real der_T;

equation
  medium1.X = {0.8,0.2};
  m1 = medium1.d*V;
  U1 = m1*medium1.u;
  der(m1) = m_flow_ext;
  der(U1) = H_flow_ext;

  medium2.X = {0.1,0.1,0.1,0.2,0.2,0.3};
  m2 = medium2.d*V;
  U2 = m2*medium2.u;
  der(m2) = m_flow_ext;
  der(U2) = H_flow_ext;

  // Smooth state
  m_flow_ext2 = time - 0.5;
  smoothState = Medium2.setSmoothState(
        m_flow_ext2,
        medium2.state,
        state2,
        0.2);
  der_p = der(smoothState.p);
  der_T = der(smoothState.T);
  annotation (Documentation(info="<html>

</html>"), experiment(StopTime=1));
end MixtureGases_305;
