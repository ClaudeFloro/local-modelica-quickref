within MslCases;
model MoistAir_314 "Example for moist air"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Temperature T_start=274
    "Initial guess value for temperature";
  parameter Modelica.Units.SI.Pressure p_start=1e5
    "Initial guess value for pressure";
  package Medium = Modelica.Media.Air.ReferenceMoistAir "Medium model";
  Medium.BaseProperties medium(
    T(start=T_start, fixed=true),
    X(start={0.95,0.05}),
    p(start=p_start, fixed=true));
  parameter Medium.MolarMass[2] MMx={Medium.dryair.MM,Medium.steam.MM}
    "Vector of molar masses (consisting of dry air and of steam)";
  Medium.MolarMass MM=1/((1 - medium.X[1])/MMx[1] + medium.X[1]/MMx[2])
    "Molar mass of gas part of mixture";
  Medium.ThermodynamicState state1;
  Medium.ThermodynamicState state2;
  Medium.ThermodynamicState smoothState(T(start=T_start), p(start=p_start));
  Real m_flow_ext;
  Real der_p;
  Real der_T;
protected
  constant Modelica.Units.SI.Time unitTime=1;
equation
  der(medium.p) = 0.0;
  der(medium.T) = 90;
  medium.X[Medium.Air] = 0.95;
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
  annotation (experiment(StopTime=1.0, Tolerance=1e-005));
end MoistAir_314;
