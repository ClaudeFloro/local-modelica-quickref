within MslCases;
model SimpleLiquidWater_317 "Example for Water.SimpleLiquidWater medium model"
  extends Modelica.Icons.Example;

  parameter Modelica.Units.SI.Volume V=1 "Volume";
  parameter Modelica.Units.SI.EnthalpyFlowRate H_flow_ext=1.e6
    "Constant enthalpy flow rate into the volume";

  package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater (SpecificEnthalpy(max=
            1e6)) "Medium model";
  Medium.BaseProperties medium(T(start=300, fixed=true));

  Medium.BaseProperties medium2;
  Medium.ThermodynamicState state;
  Real m_flow_ext2;
  Real der_p;
  Real der_T;

  Modelica.Units.SI.Mass m(start=1.0);
  Modelica.Units.SI.InternalEnergy U;

  // Use type declarations from the Medium
  Medium.MassFlowRate m_flow_ext;
  Medium.DynamicViscosity eta=Medium.dynamicViscosity(state);
  Medium.SpecificHeatCapacity cv=Medium.specificHeatCapacityCv(state);
equation
  medium.p = 1.0e5;
  m = medium.d*V;
  U = m*medium.u;

  // Mass balance
  der(m) = m_flow_ext;

  // Energy balance
  der(U) = H_flow_ext;

  // Smooth state
  medium2.p = 1e5*time/10;
  medium2.T = 330;
  m_flow_ext2 = time - 30;
  state = Medium.setSmoothState(
        m_flow_ext2,
        medium.state,
        medium2.state,
        10);
  der_p = der(state.p);
  der_T = der(state.T);
  annotation (experiment(StopTime=100), Documentation(info="<html>

</html>"));
end SimpleLiquidWater_317;
