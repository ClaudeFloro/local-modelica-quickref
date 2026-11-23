within MslCases;
model MoistAir_306 "Example for moist air"
  extends Modelica.Icons.Example;
  package Medium = Modelica.Media.Air.MoistAir "Medium model";
  Medium.BaseProperties medium(
    T(start=274.0, fixed=true),
    X(start={0.95,0.05}),
    p(start=1.0e5, fixed=true));
  //  Medium.SpecificEntropy s=Medium.specificEntropy(medium);
  //  Medium.SpecificEnthalpy h_is = Medium.isentropicEnthalpyApproximation(medium, 2.0e5);
  parameter Medium.MolarMass[2] MMx={Medium.dryair.MM,Medium.steam.MM}
    "Vector of molar masses (consisting of dry air and of steam)";
  Medium.MolarMass MM=1/((1 - medium.X[1])/MMx[1] + medium.X[1]/MMx[2])
    "Molar mass of gas part of mixture";
  //  Real[4] dddX=Medium.density_derX(medium,MM);

  Medium.ThermodynamicState state1;
  Medium.ThermodynamicState state2;
  Medium.ThermodynamicState smoothState;
  Real m_flow_ext;
  Real der_p;
  Real der_T;
protected
  constant Modelica.Units.SI.Time unitTime=1;
equation
  der(medium.p) = 0.0;
  der(medium.T) = 90;
  medium.X[Medium.Air] = 0.95;
  //    medium.X[Medium.Water] = 0.05;
  // one simple assumption only for quick testing:
  //  medium.X_liquidWater = if medium.X_sat < medium.X[2] then medium.X[2] - medium.X_sat else 0.0;

  // Smooth state
  m_flow_ext = time - 0.5;
  state1.p = 1.e5*(1 + time);
  state1.T = 300 + 10*time;
  state1.X = {time,1 - time}/unitTime;
  state2.p = 1.e5*(1 + time/2);
  state2.T = 340 - 20*time;
  state2.X = {0.5*time,1 - 0.5*time}/unitTime;
  smoothState = Medium.setSmoothState(
        m_flow_ext,
        state1,
        state2,
        0.2);
  der_p = der(smoothState.p);
  der_T = der(smoothState.T);
  annotation (Documentation(info="<html>

</html>"), experiment(StopTime=1.0, Tolerance=1e-005));
end MoistAir_306;
