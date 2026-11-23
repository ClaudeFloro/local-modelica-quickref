within ModelicaByExample.PackageExamples;
model RLC "An RLC circuit referencing types from the Modelica Standard Library"
  parameter Modelica.Units.SI.Voltage Vb=24 "Battery voltage";
  parameter Modelica.Units.SI.Inductance L = 1;
  parameter Modelica.Units.SI.Resistance R = 100;
  parameter Modelica.Units.SI.Capacitance C = 1e-3;
  Modelica.Units.SI.Voltage V(fixed=true, start=0);
  Modelica.Units.SI.Current i_L(fixed=true, start=0);
  Modelica.Units.SI.Current i_R;
  Modelica.Units.SI.Current i_C;
equation
  i_R = V/R;
  i_C = C*der(V);
  i_L=i_R+i_C;
  L*der(i_L) = (Vb-V);
end RLC;
