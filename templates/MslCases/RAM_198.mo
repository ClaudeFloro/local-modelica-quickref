within MslCases;
model RAM_198 "Simple RAM test example"
  import L = Modelica.Electrical.Digital.Interfaces.Logic;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Digital.Memories.DLATRAM 
                 dLATRAM 
    annotation (Placement(transformation(extent={{-11,-41},{103,73}})));
  Modelica.Electrical.Digital.Sources.Table 
                addr_1(
    y0=L.'U',
    x={L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',
       L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-'},
    t={5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,
        115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,
        200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,
        285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,
        370,375,380,385,390,395,400}) 
    annotation (Placement(transformation(extent={{-78,76},{-58,96}})));
  Modelica.Electrical.Digital.Sources.Set 
              data_1(x=Modelica.Electrical.Digital.Interfaces.Logic.'0') 
    annotation (Placement(transformation(extent={{-78,20},{-58,40}})));
  Modelica.Electrical.Digital.Sources.Set 
              data_0(x=Modelica.Electrical.Digital.Interfaces.Logic.'0') 
    annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
  Modelica.Electrical.Digital.Sources.Set 
              WE(x=Modelica.Electrical.Digital.Interfaces.Logic.'1') 
    annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
  Modelica.Electrical.Digital.Sources.Table 
                addr_0(
    y0=Modelica.Electrical.Digital.Interfaces.Logic.'U',
    t={45,90,135,180,225,270,315,360},
    x={L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-'}) 
    annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
  Modelica.Electrical.Digital.Sources.Set 
              RE(x=Modelica.Electrical.Digital.Interfaces.Logic.'1') 
    annotation (Placement(transformation(extent={{-78,-38},{-58,-18}})));

equation
  connect(RE.y,dLATRAM. RE) annotation (Line(
      points={{-58,-28},{-28,-28},{-28,4.6},{-6.44,4.6}}, color={127,0,127}));
  connect(WE.y,dLATRAM. WE) annotation (Line(
      points={{-58,-60},{-24,-60},{-24,-12.5},{-6.44,-12.5}}, color={127,0,127}));
  connect(addr_0.y,dLATRAM. addr[1]) annotation (Line(
      points={{-58,58},{-34,58},{-34,47.35},{-5.3,47.35}}, color={127,0,127}));
  connect(addr_1.y,dLATRAM. addr[2]) annotation (Line(
      points={{-58,86},{-32,86},{-32,53.05},{-5.3,53.05}}, color={127,0,127}));
  connect(data_1.y,dLATRAM. dataIn[2]) annotation (Line(
      points={{-58,30},{-32,30},{-32,30.25},{-5.3,30.25}}, color={127,0,127}));
  connect(data_0.y,dLATRAM. dataIn[1]) annotation (Line(
      points={{-58,2},{-34,2},{-34,24.55},{-5.3,24.55}}, color={127,0,127}));
  annotation (experiment(StopTime=400),
    Documentation(info="<html>
<p>This example is a simple and uncomplete test of a single DLATRAM component . After simulation until 400 s plot dLATRAM.addr[1], dLATRAM.addr[2], and dLATRAM.dataOUT[1], dLATRAM.dataOut[2]. The address inputs are  prescribed with all possible combinations of logic values. It can be checked in which cases of address values the output is 'X' or '0'.</p>
</html>"));
end RAM_198;
