within MslCases;
model Spice3BenchmarkMosfetCharacterization_134 "Mos output characteristics"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Spice3.Sources.V_pulse VDS( V1=0, V2=10, TD=0, TR=1e-008, TF=1e-008, PW=1, PER=1);
  Modelica.Electrical.Spice3.Sources.V_pulse VGS( V1=0, V2=5, TD=4e-008, TR=1e-009, TF=1e-009, PW=1e-008, PER=2e-008);
  Modelica.Electrical.Spice3.Semiconductors.M_NMOS M1(modelcard=MOD1, L=4e-006, W=6e-006, AD=1e-011, AS=1e-011, IC=-1e40);
  // * VIDS MEASURES ID, WE COULD HAVE USED VDS, BUT ID WOULD BE NEGATIVE
  Modelica.Electrical.Spice3.Sources.V_constant VIDS(V=0);
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardMOS MOD1(VTO=-2, NSUB=1e+015, UO=550, CBD=0, CBS=0) "Modelcard for transistor M1";

record SpiceConstants
  // NODE
  // NOPAGE
end SpiceConstants;

  Modelica.Electrical.Spice3.Basic.Ground g;

protected
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n0;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n1;

equation
  connect(g.p,n0);
  connect(VDS.p, n3);
  connect(VDS.n, n0);
  connect(VGS.p, n2);
  connect(VGS.n, n0);
  connect(M1.D, n1);
  connect(M1.G, n2);
  connect(M1.S, n0);
  connect(M1.B, n0);
  connect(VIDS.p, n3);
  connect(VIDS.n, n1);

  annotation (experiment(StopTime=1e-007, Interval=1e-009),
    Documentation(info="<html>
<p>This Mosfet Characterization model is one of the five benchmark circuits described in the SPICE3 Version e3 User&#39;s Manual (see information of package Spice3).</p>
<p>This circuit is a very simple one than consists of an NMOS transistor level 1 that is connected to voltage sources at gate and drain node whereas the drain voltage source supplies the
operating voltage. The user is recommended to simulate from t=0 to t=1e-7s and observe the gate node voltage (\"VGS.p.v\") and the transistor current (\"M1.D.i\").
It can be seen that the current is increasing with increasing gate voltage which means the conductivity of the transistor is increasing. The opposite case occurs for decreasing gate voltage.</p>
<p>Original SPICE3 netlist of the MOSFET characterization circuit:</p>
<blockquote><pre>
MOS OUTPUT CHARACTERISTICS<br>
.OPTIONS NODE NOPAGE<br>
VDS 3 0<br>
VGS 2 0<br>
M1 1 2 0 0 MOD1 L=4U W=6U AD=10P AS=10P<br>
*VIDS MEASURES ID, WE COULD HAVE USED VDS, BUT IT WOULD BE NEGATIVE VIDS 3 1
.MODEL MOD1 NMOS VTO=-2 NSUB=1.0E15 UO=550<br>
.DC VDS 0 10 .5 VGS 0 5 1<br>
.END
</pre></blockquote>
</html>"));
end Spice3BenchmarkMosfetCharacterization_134;
