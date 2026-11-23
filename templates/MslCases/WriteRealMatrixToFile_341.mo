within MslCases;
model WriteRealMatrixToFile_341
  "Demonstrate usage of function Streams.writeRealMatrix"
  extends Modelica.Icons.Example;
  parameter Real A[3,2] = [11, 12;
                           21, 22;
                           31, 32] "Matrix stored in different formats on files";
  output Boolean success1 "= true if writing to Test_RealMatrix_v4.mat is successful";
  output Boolean success2 "= true if appending to Test_RealMatrix_v4.mat is successful";
  output Boolean success3 "= true if writing to Test_RealMatrix_v6.mat is successful";
  output Boolean success4 "= true if writing to Test_RealMatrix_v7.mat is successful";
algorithm
  when initial() then
    success1 := Modelica.Utilities.Streams.writeRealMatrix("Test_RealMatrix_v4.mat", "Matrix_A", A);
    success2 := Modelica.Utilities.Streams.writeRealMatrix("Test_RealMatrix_v4.mat", "Matrix_B", A, append=true, format="4");
    success3 := Modelica.Utilities.Streams.writeRealMatrix("Test_RealMatrix_v6.mat", "Matrix_A", A, format="6");
    success4 := Modelica.Utilities.Streams.writeRealMatrix("Test_RealMatrix_v7.mat", "Matrix_A", A, format="7");
  end when;

  annotation (preferredView="text", experiment(StopTime=0.1), Documentation(info="<html>
<p>
Example model that shows how to write a Real matrix in MATLAB MAT format on file
using function <a href=\"modelica://Modelica.Utilities.Streams.writeRealMatrix\">writeRealMatrix</a>.
</p>
</html>"));
end WriteRealMatrixToFile_341;
