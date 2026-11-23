within MslCases;
model IdealGasH2O_304 "IdealGas H20 medium model"
  extends Modelica.Icons.Example;
  package Medium = Modelica.Media.IdealGases.SingleGases.H2O "Medium model";
  Medium.ThermodynamicState state "Thermodynamic state record";
  Medium.ThermodynamicState state2;
  Medium.SpecificHeatCapacity cp=Medium.specificHeatCapacityCp(state);
  Medium.SpecificHeatCapacity cv=Medium.specificHeatCapacityCv(state);
  Medium.IsentropicExponent k=Medium.isentropicExponent(state);
  Medium.SpecificEntropy s=Medium.specificEntropy(state);
  //  Medium.SpecificEntropy s2=Medium.specificEntropy(state2);
  Medium.VelocityOfSound a=Medium.velocityOfSound(state);
  Real beta=Medium.isobaricExpansionCoefficient(state);
  Real gamma=Medium.isothermalCompressibility(state);
  Medium.SpecificEnthalpy h_is=Medium.isentropicEnthalpyApproximation(2.0,
      state);

  Medium.ThermodynamicState smoothState;
  Real m_flow_ext;
  Real der_p;
  Real der_T;

equation
  state.p = 100000.0;
  state.T = 200 + 1000*time;
  state2.p = 2.0e5;
  state2.T = 500.0;
  //  s2 = s;

  // Smooth state
  m_flow_ext = time - 0.5;
  smoothState = Medium.setSmoothState(
        m_flow_ext,
        state,
        state2,
        0.1);
  der_p = der(smoothState.p);
  der_T = der(smoothState.T);

  annotation (Documentation(info="<html>
<p>An example for using ideal gas properties and how to compute isentropic enthalpy changes.
The function that is implemented is approximate, but usually very good: the second medium record medium2
is given to compare the approximation.
</p>
</html>"), experiment(StopTime=1));
end IdealGasH2O_304;
