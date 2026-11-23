within MslCases;
model Spice3BenchmarkRtlInverter_135 "Simple RTL inverter"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Spice3.Sources.V_constant VCC(V=5);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN( V1=0, V2=5, TD=2e-009, TR=2e-009, TF=2e-009, PW=3e-008);
  Modelica.Electrical.Spice3.Basic.R_Resistor RB(R=10000);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q1(modelcard=Q11, vbc(start=0, fixed=true), vbe(start=0, fixed=true));
  Modelica.Electrical.Spice3.Basic.R_Resistor RC(R=1000);
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT Q11(BF=20, RB=100, TF=1e-010, CJC=2e-012) "Modelcard for transistor Q1";
  Modelica.Electrical.Spice3.Basic.Ground g;

protected
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n0;
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;

equation
  connect(g.p,n0);
  connect(VCC.p, n4);
  connect(VCC.n, n0);
  connect(VIN.p, n1);
  connect(VIN.n, n0);
  connect(RB.p, n1);
  connect(RB.n, n2);
  connect(Q1.C, n3);
  connect(Q1.B, n2);
  connect(Q1.E, n0);
  connect(RC.p, n3);
  connect(RC.n, n4);

  annotation (experiment(
      StopTime=1e-007,
      Interval=1e-010,
      Tolerance=1e-008),
    Documentation(info="<html>
<p>This RTL Inverter model is one of the five benchmark circuits described in the SPICE3 Version e3 User&#39;s Manual (see information of package Spice3).</p>
<p>This simple RTL inverter (resistor transistor logic) circuits inverts the input voltage which means the output voltage has high potential if the input voltage
has low potential and the other way round. To comprehend this behaviour the user is recommended to simulate from t=0 to t=1e-7s and observe the input voltage (VIN.p.v)
and the output voltage (Q1.C.v)</p>
<p>Original SPICE3 netlist of the RTL inverter:</p>
<blockquote><pre>
SIMPLE RTL INVERTER<br>
VCC 4 0 5<br>
VIN 1 0 PULSE 0 5 2NS 2NS 2NS 30NS<br>
RB 1 2 10K<br>
Q1 3 2 0 Q1<br>
RC 3 4 1K<br>
.MODEL Q1 NPN BF 20 RB 100 TF .1NS CJC 2PF<br>
.DC VIN 0 5 0.1<br>
.TRAN 1NS 100NS<br>
.END
</pre></blockquote>
</html>"));
end Spice3BenchmarkRtlInverter_135;
