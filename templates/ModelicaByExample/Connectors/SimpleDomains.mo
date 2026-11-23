within ModelicaByExample.Connectors;
package SimpleDomains "Examples of connectors for simple domains"
  connector Electrical
     Modelica.Units.SI.Voltage v;
     flow Modelica.Units.SI.Current i;
  end Electrical;

  connector Thermal
     Modelica.Units.SI.Temperature T;
     flow Modelica.Units.SI.HeatFlowRate q;
  end Thermal;

  connector Translational
     Modelica.Units.SI.Position x;
     flow Modelica.Units.SI.Force f;
  end Translational;

  connector Rotational
     Modelica.Units.SI.Angle phi;
     flow Modelica.Units.SI.Torque tau;
  end Rotational;
end SimpleDomains;
