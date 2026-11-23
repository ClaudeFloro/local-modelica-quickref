within ModelicaByExample.Connectors;
package FluidConnectors "Examples of fluid connectors"
  connector Incompressible
    Modelica.Units.SI.Pressure p;
    flow Modelica.Units.SI.VolumeFlowRate q;
  end Incompressible;

  connector GenericFluid
    Modelica.Units.SI.Pressure p;
    flow Modelica.Units.SI.MassFlowRate m_flow;
  end GenericFluid;

  connector ThermoFluid
    Modelica.Units.SI.Pressure p;
    flow Modelica.Units.SI.MassFlowRate m_flow;
    Modelica.Units.SI.Temperature T;
    flow Modelica.Units.SI.HeatFlowRate q;
  end ThermoFluid;
end FluidConnectors;
