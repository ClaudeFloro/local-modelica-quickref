within MslCases;
model WaterIF97_322 "WaterIF97 medium model"
  extends Modelica.Icons.Example;
  package Medium = Modelica.Media.Water.StandardWater "Medium model";
  Medium.BaseProperties medium(
    p(start=1.e5,
      fixed=true,
      stateSelect=StateSelect.prefer),
    h(start=1.0e5,
      fixed=true,
      stateSelect=StateSelect.prefer),
    T(start=275.0),
    d(start=999.0));
  Modelica.Units.SI.Volume V(start=0.1, fixed=true);
  parameter Modelica.Units.SI.VolumeFlowRate dV=0.0
    "Fixed time derivative of volume";
  parameter Medium.MassFlowRate m_flow_ext=0
    "Fixed mass flow rate into volume";
  parameter Medium.EnthalpyFlowRate H_flow_ext=10000
    "Fixed enthalpy flow rate into volume";
  Modelica.Units.SI.Mass m "Mass of volume";
  Modelica.Units.SI.InternalEnergy U "Internal energy of volume";

  Medium.ThermodynamicState state2;
  Medium.ThermodynamicState state;
  Real m_flow_ext2;
  Real der_p;
  Real der_T;

equation
  der(V) = dV;
  m = medium.d*V;
  U = m*medium.u;

  // Mass balance
  der(m) = m_flow_ext;

  // Energy balance
  der(U) = H_flow_ext;

  // smooth states
  m_flow_ext2 = time - 0.5;
  state2 = Medium.setState_pT(1e5*(1 + time), 300 + 200*time);
  state = Medium.setSmoothState(
        m_flow_ext2,
        medium.state,
        state2,
        0.05);
  der_p = der(state.p);
  der_T = der(state.T);
  annotation (Documentation(info="<html>

</html>"), experiment(StopTime=1));
end WaterIF97_322;
