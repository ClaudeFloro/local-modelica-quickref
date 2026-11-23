within MslCases;
model Spice3BenchmarkDifferentialPair_132 "Simple differential pair"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Spice3.Sources.V_pulse VCC( V1=0, V2=12, TD=0, TR=2e-009, TF=2e-009, PW=3);
  Modelica.Electrical.Spice3.Sources.V_pulse VEE( V1=0, V2=-12, TD=0, TR=2e-009, TF=2e-009, PW=3);
  Modelica.Electrical.Spice3.Sources.V_sin VIN( VO=0, VA=0.01, FREQ=5);
  Modelica.Electrical.Spice3.Basic.R_Resistor RS1(R=1000, v(start=0));
  Modelica.Electrical.Spice3.Basic.R_Resistor RS2(R=1000);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q1(modelcard=MOD1, Binternal(start=0), vbe(start=0, fixed=true));
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q2(modelcard=MOD1, icapbe(start=0), vbc(start=0), vbe(start=0, fixed=true));
  Modelica.Electrical.Spice3.Basic.R_Resistor RC1(R=10000, v(start=0));
  Modelica.Electrical.Spice3.Basic.R_Resistor RC2(R=10000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RE(R=10000);
  Modelica.Electrical.Spice3.Sources.V_constant VIE(V=0);
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT MOD1(BF=50, VAF=50, IS=1e-012, RB=100, CJC=5e-09, TF=6e-010) "Modelcard for transistors Q1 and Q2";
  Modelica.Electrical.Spice3.Basic.Ground g;

  Real OutputVoltage;

protected
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n0;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n42;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n41;
initial equation
  der(Q1.vbc)=0;
  der(Q2.vbc)=0;
equation
  OutputVoltage=Q2.C.v - Q1.C.v;
  connect(g.p,n0);
  connect(VCC.p, n7);
  connect(VCC.n, n0);
  connect(VEE.p, n8);
  connect(VEE.n, n0);
  connect(VIN.p, n1);
  connect(VIN.n, n0);
  connect(RS1.p, n1);
  connect(RS1.n, n2);
  connect(RS2.p, n6);
  connect(RS2.n, n0);
  connect(Q1.C, n3);
  connect(Q1.B, n2);
  connect(Q1.E, n42);
  connect(Q2.C, n5);
  connect(Q2.B, n6);
  connect(Q2.E, n42);
  connect(RC1.p, n7);
  connect(RC1.n, n3);
  connect(RC2.p, n7);
  connect(RC2.n, n5);
  connect(RE.p, n41);
  connect(RE.n, n8);
  connect(VIE.p, n41);
  connect(VIE.n, n42);

  annotation (experiment(StopTime=1, Interval=0.001,
      Tolerance=1e-005),
      Documentation(info="<html>
<p>This Differential pair model is one of the five benchmark circuits described in the SPICE3 Version e3 User&#39;s Manual (see information of package Spice3).</p>
<p>The differential pair circuit is operating in the differential mode. This means the input voltage VIN that is only applied at one transistor
is amplified. To comprehend this behavior the user is recommended to simulate from t=0 to t=1s and observe \"VIN.p.v\" which is the input voltage and \"Outputvoltage\" which is the
amplified output voltage.</p>
<p>Original SPICE3 netlist of the Differential pair:</p>
<blockquote><pre>
SIMPLE DIFFERENTIAL PAIR<br>
VCC 7 0 12<br>
VEE 8 0 -12<br>
VIN 1 0 AC 1<br>
RS1 1 2 1K<br>
RS2 6 0 1K<br>
Q1 3 2 4 MOD1<br>
Q2 5 6 4 MOD1<br>
RC1 7 3 10K<br>
RC2 7 5 10K<br>
RE 4 8 10K<br>
.MODEL MOD1 NPN BF=50 VAF=50 IS=1.E-12 RB=100 CJC=.5PF TF=.6NS<br>
.TF V(5) VIN<br>
.AC DEC 10 1 100MEG<br>
.END
</pre></blockquote>
<p>In the Modelica representation the tiny capacity CJC was set to 1e-9F to get a higher numerical
robustness. The numerical behavior needs to be analysed before the original value
CJC=.5PF can be applied.</p>
</html>"));
end Spice3BenchmarkDifferentialPair_132;
