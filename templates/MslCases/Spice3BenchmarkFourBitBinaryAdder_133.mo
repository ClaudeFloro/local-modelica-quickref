within MslCases;
model Spice3BenchmarkFourBitBinaryAdder_133
  "ADDER - 4 BIT ALL-NAND-GATE BINARY ADDER"
  extends Modelica.Icons.Example;

  output Real X1_p9_v =  X1.p9.v;
  output Real X1_p10_v = X1.p10.v;
  output Real X1_p11_v = X1.p11.v;
  output Real X1_p12_v = X1.p12.v;
  output Real X1_p14_v = X1.p14.v;
  output Real X1_p1_v =  X1.p1.v;
  output Real X1_p2_v =  X1.p2.v;
  output Real X1_p3_v =  X1.p3.v;
  output Real X1_p4_v =  X1.p4.v;
  output Real X1_p5_v =  X1.p5.v;
  output Real X1_p6_v =  X1.p6.v;
  output Real X1_p7_v =  X1.p7.v;
  output Real X1_p8_v =  X1.p8.v;

  // *** SUBCIRCUIT DEFINITIONS

model NAND ".SUBCKT NAND 1 2 3 4"

  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardDIODE DMOD;
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

  // *   NODES:  INPUT(2), OUTPUT, VCC
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q1(modelcard=QMOD);
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D1CLAMP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q2(modelcard=QMOD);
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE D2CLAMP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
  Modelica.Electrical.Spice3.Basic.R_Resistor RB(R=4000);
  Modelica.Electrical.Spice3.Basic.R_Resistor R1(R=1600);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q3(modelcard=QMOD);
  Modelica.Electrical.Spice3.Basic.R_Resistor R2(R=1000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RC(R=130);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q4(modelcard=QMOD);
  Modelica.Electrical.Spice3.Semiconductors.D_DIODE DVBEDROP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
  Modelica.Electrical.Spice3.Semiconductors.Q_NPNBJT Q5(modelcard=QMOD);
  Modelica.Electrical.Spice3.Basic.Ground g;
  Modelica.Electrical.Analog.Interfaces.Pin p1;
  Modelica.Electrical.Analog.Interfaces.Pin p2;
  Modelica.Electrical.Analog.Interfaces.Pin p3;
  Modelica.Electrical.Analog.Interfaces.Pin p4;

  protected
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n9;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n0;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n10;

equation
  connect(g.p,n0);
  connect(p1,n1);
  connect(p2,n2);
  connect(p3,n3);
  connect(p4,n4);
  connect(Q1.C, n9);
  connect(Q1.B, n5);
  connect(Q1.E, n1);
  connect(D1CLAMP.p, n0);
  connect(D1CLAMP.n, n1);
  connect(Q2.C, n9);
  connect(Q2.B, n5);
  connect(Q2.E, n2);
  connect(D2CLAMP.p, n0);
  connect(D2CLAMP.n, n2);
  connect(RB.p, n4);
  connect(RB.n, n5);
  connect(R1.p, n4);
  connect(R1.n, n6);
  connect(Q3.C, n6);
  connect(Q3.B, n9);
  connect(Q3.E, n8);
  connect(R2.p, n8);
  connect(R2.n, n0);
  connect(RC.p, n4);
  connect(RC.n, n7);
  connect(Q4.C, n7);
  connect(Q4.B, n6);
  connect(Q4.E, n10);
  connect(DVBEDROP.p, n10);
  connect(DVBEDROP.n, n3);
  connect(Q5.C, n3);
  connect(Q5.B, n8);
  connect(Q5.E, n0);

end NAND;

model ONEBIT ".SUBCKT ONEBIT 1 2 3 4 5 6"

  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardDIODE DMOD;
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

  // *   NODES:  INPUT(2), CARRY-IN, OUTPUT, CARRY-OUT, VCC
  NAND X1;
  NAND X2;
  NAND X3;
  NAND X4;
  NAND X5;
  NAND X6;
  NAND X7;
  NAND X8;
  NAND X9;
  Modelica.Electrical.Analog.Interfaces.Pin p1;
  Modelica.Electrical.Analog.Interfaces.Pin p2;
  Modelica.Electrical.Analog.Interfaces.Pin p3;
  Modelica.Electrical.Analog.Interfaces.Pin p4;
  Modelica.Electrical.Analog.Interfaces.Pin p5;
  Modelica.Electrical.Analog.Interfaces.Pin p6;

  protected
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n9;
  Modelica.Electrical.Analog.Interfaces.Pin n10;
  Modelica.Electrical.Analog.Interfaces.Pin n11;
  Modelica.Electrical.Analog.Interfaces.Pin n12;
  Modelica.Electrical.Analog.Interfaces.Pin n13;

equation
  connect(p1,n1);
  connect(p2,n2);
  connect(p3,n3);
  connect(p4,n4);
  connect(p5,n5);
  connect(p6,n6);
  connect(X1.p1, n1);
  connect(X1.p2, n2);
  connect(X1.p3, n7);
  connect(X1.p4, n6);
  connect(X2.p1, n1);
  connect(X2.p2, n7);
  connect(X2.p3, n8);
  connect(X2.p4, n6);
  connect(X3.p1, n2);
  connect(X3.p2, n7);
  connect(X3.p3, n9);
  connect(X3.p4, n6);
  connect(X4.p1, n8);
  connect(X4.p2, n9);
  connect(X4.p3, n10);
  connect(X4.p4, n6);
  connect(X5.p1, n3);
  connect(X5.p2, n10);
  connect(X5.p3, n11);
  connect(X5.p4, n6);
  connect(X6.p1, n3);
  connect(X6.p2, n11);
  connect(X6.p3, n12);
  connect(X6.p4, n6);
  connect(X7.p1, n10);
  connect(X7.p2, n11);
  connect(X7.p3, n13);
  connect(X7.p4, n6);
  connect(X8.p1, n12);
  connect(X8.p2, n13);
  connect(X8.p3, n4);
  connect(X8.p4, n6);
  connect(X9.p1, n11);
  connect(X9.p2, n7);
  connect(X9.p3, n5);
  connect(X9.p4, n6);

end ONEBIT;

model TWOBIT ".SUBCKT TWOBIT 1 2 3 4 5 6 7 8 9"

  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardDIODE DMOD;
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

  // *   NODES:  INPUT - BIT0(2) / BIT1(2), OUTPUT - BIT0 / BIT1,
  // *           CARRY-IN, CARRY-OUT, VCC
  ONEBIT X1;
  ONEBIT X2;
  Modelica.Electrical.Analog.Interfaces.Pin p1;
  Modelica.Electrical.Analog.Interfaces.Pin p2;
  Modelica.Electrical.Analog.Interfaces.Pin p3;
  Modelica.Electrical.Analog.Interfaces.Pin p4;
  Modelica.Electrical.Analog.Interfaces.Pin p5;
  Modelica.Electrical.Analog.Interfaces.Pin p6;
  Modelica.Electrical.Analog.Interfaces.Pin p7;
  Modelica.Electrical.Analog.Interfaces.Pin p8;
  Modelica.Electrical.Analog.Interfaces.Pin p9;

  protected
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n9;
  Modelica.Electrical.Analog.Interfaces.Pin n10;

equation
  connect(p1,n1);
  connect(p2,n2);
  connect(p3,n3);
  connect(p4,n4);
  connect(p5,n5);
  connect(p6,n6);
  connect(p7,n7);
  connect(p8,n8);
  connect(p9,n9);
  connect(X1.p1, n1);
  connect(X1.p2, n2);
  connect(X1.p3, n7);
  connect(X1.p4, n5);
  connect(X1.p5, n10);
  connect(X1.p6, n9);
  connect(X2.p1, n3);
  connect(X2.p2, n4);
  connect(X2.p3, n10);
  connect(X2.p4, n6);
  connect(X2.p5, n8);
  connect(X2.p6, n9);

end TWOBIT;

model FOURBIT ".SUBCKT FOURBIT 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"

  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardDIODE DMOD;
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

  // *   NODES:  INPUT - BIT0(2) / BIT1(2) / BIT2(2) / BIT3(2),
  // *           OUTPUT - BIT0 / BIT1 / BIT2 / BIT3, CARRY-IN, CARRY-OUT, VCC
  TWOBIT X1;
  TWOBIT X2;
  Modelica.Electrical.Analog.Interfaces.Pin p1;
  Modelica.Electrical.Analog.Interfaces.Pin p2;
  Modelica.Electrical.Analog.Interfaces.Pin p3;
  Modelica.Electrical.Analog.Interfaces.Pin p4;
  Modelica.Electrical.Analog.Interfaces.Pin p5;
  Modelica.Electrical.Analog.Interfaces.Pin p6;
  Modelica.Electrical.Analog.Interfaces.Pin p7;
  Modelica.Electrical.Analog.Interfaces.Pin p8;
  Modelica.Electrical.Analog.Interfaces.Pin p9;
  Modelica.Electrical.Analog.Interfaces.Pin p10;
  Modelica.Electrical.Analog.Interfaces.Pin p11;
  Modelica.Electrical.Analog.Interfaces.Pin p12;
  Modelica.Electrical.Analog.Interfaces.Pin p13;
  Modelica.Electrical.Analog.Interfaces.Pin p14;
  Modelica.Electrical.Analog.Interfaces.Pin p15;

  protected
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n9;
  Modelica.Electrical.Analog.Interfaces.Pin n10;
  Modelica.Electrical.Analog.Interfaces.Pin n11;
  Modelica.Electrical.Analog.Interfaces.Pin n12;
  Modelica.Electrical.Analog.Interfaces.Pin n13;
  Modelica.Electrical.Analog.Interfaces.Pin n14;
  Modelica.Electrical.Analog.Interfaces.Pin n15;
  Modelica.Electrical.Analog.Interfaces.Pin n16;

equation
  connect(p1,n1);
  connect(p2,n2);
  connect(p3,n3);
  connect(p4,n4);
  connect(p5,n5);
  connect(p6,n6);
  connect(p7,n7);
  connect(p8,n8);
  connect(p9,n9);
  connect(p10,n10);
  connect(p11,n11);
  connect(p12,n12);
  connect(p13,n13);
  connect(p14,n14);
  connect(p15,n15);
  connect(X1.p1, n1);
  connect(X1.p2, n2);
  connect(X1.p3, n3);
  connect(X1.p4, n4);
  connect(X1.p5, n9);
  connect(X1.p6, n10);
  connect(X1.p7, n13);
  connect(X1.p8, n16);
  connect(X1.p9, n15);
  connect(X2.p1, n5);
  connect(X2.p2, n6);
  connect(X2.p3, n7);
  connect(X2.p4, n8);
  connect(X2.p5, n11);
  connect(X2.p6, n12);
  connect(X2.p7, n16);
  connect(X2.p8, n14);
  connect(X2.p9, n15);

end FOURBIT;

  // *** DEFINE NOMINAL CIRCUIT
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardDIODE DMOD "Modelcard for diodes";
  parameter Modelica.Electrical.Spice3.Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012) "Modelcard for transistors";
  Modelica.Electrical.Spice3.Sources.V_constant VCC(V=5);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN1A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1e-008, PER=5e-008);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN1B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=2e-008, PER=1e-007);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN2A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=4e-008, PER=2e-007);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN2B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=8e-008, PER=4e-007);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN3A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1.6e-007, PER=8e-007);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN3B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=3.2e-007, PER=1.6e-006);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN4A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=6.4e-007, PER=3.2e-006);
  Modelica.Electrical.Spice3.Sources.V_pulse VIN4B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1.28e-006, PER=6.4e-006);
  FOURBIT X1( X1(   X1( X1( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true),vbe(start=0))),
                        X2( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X5( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0))),
                        X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true), vbc(start=0, fixed=true)),
                            RC(v(start=0))),
                        X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0),vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0)))),
                     X2(X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=false)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true))),
                        X2( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X5( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true),vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))))),
              X2(   X1( X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true))),
                        X2( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X5( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0)))),
                    X2( X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true)),
                            RC(v(start=0))),
                        X2( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X5( Q1(vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbe(start=0, fixed=true))),
                        X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            RC(v(start=0))),
                        X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                        X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q4(Binternal(start=0),icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                            Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))))));

  Modelica.Electrical.Spice3.Basic.R_Resistor RBIT0(R=1000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RBIT1(R=1000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RBIT2(R=1000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RBIT3(R=1000);
  Modelica.Electrical.Spice3.Basic.R_Resistor RCOUT(R=1000);
  Modelica.Electrical.Spice3.Basic.Ground g;

protected
  Modelica.Electrical.Analog.Interfaces.Pin n99;
  Modelica.Electrical.Analog.Interfaces.Pin n0;
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin n3;
  Modelica.Electrical.Analog.Interfaces.Pin n4;
  Modelica.Electrical.Analog.Interfaces.Pin n5;
  Modelica.Electrical.Analog.Interfaces.Pin n6;
  Modelica.Electrical.Analog.Interfaces.Pin n7;
  Modelica.Electrical.Analog.Interfaces.Pin n8;
  Modelica.Electrical.Analog.Interfaces.Pin n9;
  Modelica.Electrical.Analog.Interfaces.Pin n10;
  Modelica.Electrical.Analog.Interfaces.Pin n11;
  Modelica.Electrical.Analog.Interfaces.Pin n12;
  Modelica.Electrical.Analog.Interfaces.Pin n13;

equation
  connect(g.p,n0);
  connect(VCC.p, n99);
  connect(VCC.n, n0);
  connect(VIN1A.p, n1);
  connect(VIN1A.n, n0);
  connect(VIN1B.p, n2);
  connect(VIN1B.n, n0);
  connect(VIN2A.p, n3);
  connect(VIN2A.n, n0);
  connect(VIN2B.p, n4);
  connect(VIN2B.n, n0);
  connect(VIN3A.p, n5);
  connect(VIN3A.n, n0);
  connect(VIN3B.p, n6);
  connect(VIN3B.n, n0);
  connect(VIN4A.p, n7);
  connect(VIN4A.n, n0);
  connect(VIN4B.p, n8);
  connect(VIN4B.n, n0);
  connect(X1.p1, n1);
  connect(X1.p2, n2);
  connect(X1.p3, n3);
  connect(X1.p4, n4);
  connect(X1.p5, n5);
  connect(X1.p6, n6);
  connect(X1.p7, n7);
  connect(X1.p8, n8);
  connect(X1.p9, n9);
  connect(X1.p10, n10);
  connect(X1.p11, n11);
  connect(X1.p12, n12);
  connect(X1.p13, n0);
  connect(X1.p14, n13);
  connect(X1.p15, n99);
  connect(RBIT0.p, n9);
  connect(RBIT0.n, n0);
  connect(RBIT1.p, n10);
  connect(RBIT1.n, n0);
  connect(RBIT2.p, n11);
  connect(RBIT2.n, n0);
  connect(RBIT3.p, n12);
  connect(RBIT3.n, n0);
  connect(RCOUT.p, n13);
  connect(RCOUT.n, n0);

  annotation (experiment(StopTime=1e-006, Interval=1e-009),
    Documentation(info="<html>
<p>This Four Bit Binary Adder model is one of the five benchmark circuits described in the SPICE3 Version e3 User&#39;s Manual (see information of package Spice3).</p>
<p>The model adds two 4-bit numbers (Number A and Number B). It has eight inputs where the first one is the lowest-order bit of the first number (Number A Bit0), the second is the lowest-order bit of the second number (Number B Bit0), the third one is the second-order bit of the first number (Number A Bit1) and so on. The Four Bit Binary Adder has four outputs where the first one (Sum Bit0) is the lowest-order bit, the second and the third one (Sum Bit1 and Sum Bit2) are the next two bits and the last one (Sum Bit3) is the highest-order bit. The picture illustrates the pin-assignment.</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Spice3/FourBitBinaryAdder.jpg\"
     alt=\"segment.png\">
</blockquote>

<p>Inside the model the names of the inputs refer to the names in the picture as follows:</p>
<p>X1_p1_v --> Number A Bit0</p>
<p>X1_p2_v --> Number B Bit0</p>
<p>X1_p3_v --> Number A Bit1</p>
<p>X1_p4_v --> Number B Bit1</p>
<p>X1_p5_v --> Number A Bit2</p>
<p>X1_p6_v --> Number B Bit2</p>
<p>X1_p7_v --> Number A Bit3</p>
<p>X1_p8_v --> Number B Bit3</p>
<p>X1_p9_v --> Sum Bit0</p>
<p>X1_p10_v --> Sum Bit1</p>
<p>X1_p11_v --> Sum Bit2</p>
<p>X1_p12_v --> Sum Bit3</p>
<p>X1_p14_v --> Cout</p>
<p>The Four Bit Binary Adder is built out of two two bit adders which respectively are built out of two one bit adders. One one bit adder is build out of nine NAND circuits.</p>
<p>Please note, that the simulation time of the Four Bit Binary Adder can take several hours due to its immense size (e.g. 11387 equations).</p>
<p>The user is recommended to simulate from t=0 to t=1e-6s and observe the eight inputs (X1_p1_v, ..., X1_p8_v) and the four outputs (X1_p9_v, ..., X1_p12_v) and the carryout output (X1_p14_v).</p>
<p><strong>The timing of the single transistors of the adder causes a delay which makes it hard to recognize the adder behaviour. Since the Four Bit Binary Adder is a SPICE3 benchmark, the circuit is not changed in order to see the adder behaviour in a better way.</strong></p>
<p>Original SPICE3 netlist of the Four Bit Binary Adder:</p>
<blockquote><pre>
ADDER - 4 BIT ALL-NAND-GATE BINARY ADDER

*** SUBCIRCUIT DEFINITIONS
.SUBCKT NAND 1 2 3 4
*   NODES:  INPUT(2), OUTPUT, VCC
Q1        9  5  1 QMOD
D1CLAMP   0  1    DMOD
Q2        9  5  2 QMOD
D2CLAMP   0  2    DMOD
RB        4  5    4K
R1        4  6    1.6K
Q3        6  9  8 QMOD
R2        8  0    1K
RC        4  7    130
Q4        7  6 10 QMOD
DVBEDROP 10  3    DMOD
Q5        3  8  0 QMOD
.ENDS NAND

.SUBCKT ONEBIT 1 2 3 4 5 6
*   NODES:  INPUT(2), CARRY-IN, OUTPUT, CARRY-OUT, VCC
X1   1  2  7  6   NAND
X2   1  7  8  6   NAND
X3   2  7  9  6   NAND
X4   8  9 10  6   NAND
X5   3 10 11  6   NAND
X6   3 11 12  6   NAND
X7  10 11 13  6   NAND
X8  12 13  4  6   NAND
X9  11  7  5  6   NAND
.ENDS ONEBIT

.SUBCKT TWOBIT 1 2 3 4 5 6 7 8 9
*   NODES:  INPUT - BIT0(2) / BIT1(2), OUTPUT - BIT0 / BIT1,
*           CARRY-IN, CARRY-OUT, VCC
X1   1  2  7  5 10  9   ONEBIT
X2   3  4 10  6  8  9   ONEBIT
.ENDS TWOBIT

.SUBCKT FOURBIT 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
*   NODES:  INPUT - BIT0(2) / BIT1(2) / BIT2(2) / BIT3(2),
*           OUTPUT - BIT0 / BIT1 / BIT2 / BIT3, CARRY-IN, CARRY-OUT, VCC
X1   1  2  3  4  9 10 13 16 15   TWOBIT
X2   5  6  7  8 11 12 16 14 15   TWOBIT
.ENDS FOURBIT

*** DEFINE NOMINAL CIRCUIT
.MODEL DMOD D
.MODEL QMOD NPN(BF=75 RB=100 CJE=1PF CJC=3PF)
VCC   99  0   DC 5V
VIN1A  1  0   PULSE(0 3 0 10NS 10NS   10NS   50NS)
VIN1B  2  0   PULSE(0 3 0 10NS 10NS   20NS  100NS)
VIN2A  3  0   PULSE(0 3 0 10NS 10NS   40NS  200NS)
VIN2B  4  0   PULSE(0 3 0 10NS 10NS   80NS  400NS)
VIN3A  5  0   PULSE(0 3 0 10NS 10NS  160NS  800NS)
VIN3B  6  0   PULSE(0 3 0 10NS 10NS  320NS 1600NS)
VIN4A  7  0   PULSE(0 3 0 10NS 10NS  640NS 3200NS)
VIN4B  8  0   PULSE(0 3 0 10NS 10NS 1280NS 6400NS)
X1     1  2  3  4  5  6  7  8  9 10 11 12  0 13 99 FOURBIT
RBIT0  9  0   1K
RBIT1 10  0   1K
RBIT2 11  0   1K
RBIT3 12  0   1K
RCOUT 13  0   1K

*** (FOR THOSE WITH MONEY (AND MEMORY) TO BURN)
.TRAN 1NS 6400NS UIC

.control
run
set options no break

*plot v(1) v(2)
*plot v(3) v(4)
*plot v(5) v(6)
*plot v(7) v(8)
*plot v(9) v(10)
*plot v(11) v(12)
*plot v(13)
*print v(9) v(10)
print v(11) v(12) v(13)

.endc

.END
</pre></blockquote>
<p>The model is built out of several subcircuits which were described only ones and used several times.</p>
</html>"));
end Spice3BenchmarkFourBitBinaryAdder_133;
