module floatingPointAdder(input [31:0] A, B, input clk, rst, start ,output done, output [31:0] Ans,output signOne, signTwo, output [7:0] expOne, expTwo, output [22:0] manOne, manTwo,output ldS1, ldS2, ldExp1, ldExp2, 
  ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM, output [24:0] twosOne, twosTwo, output[24:0] BReg, output[23:0]AReg, output[24:0] S, output complete, output [7:0] subAns, output [24:0] FMInput,  output [2:0] ps,ns, output [24:0] addAnswer);
  
  wire OV;
  dataPath DATA_PATH(ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM, A, B, clk, rst, complete, OV, Ans ,signOne, signTwo,expOne, expTwo, manOne, manTwo, twosOne, twosTwo,  BReg,S, AReg,subAns, FMInput, addAnswer);
  controller CONTROLLER(clk, rst, start, complete, OV, done, ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM, ps, ns);
endmodule 
