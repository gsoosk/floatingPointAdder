module dataPath(input  ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM,
  input[31:0] floatOne, floatTwo, input clk, rst, output complete, OV, output[31:0] floatAns ,
  output signOne, signTwo, output [7:0] expOne, expTwo, output [22:0] manOne, manTwo, output[24:0] twosOne, twosTwo, output[24:0] B,output[24:0] S, output[23:0]A , output [7:0] subAns, output [24:0] FMInput
  ,output [24:0] addAnswer);
  //wire signOne, signTwo;
  SFF S1(clk, rst, ldS1, floatOne[31], signOne);
  SFF S2(clk, rst, ldS2, floatTwo[31], signTwo);
  
  //wire [7:0] expOne, expTwo;
  ExpReg expReg1(clk, rst, ldExp1, floatOne[30:23], expOne);
  ExpReg expReg2(clk, rst, ldExp2, floatTwo[30:23], expTwo);
  
  //wire [22:0] manOne, manTwo;
  ManReg manReg1(clk, rst, ldM1, floatOne[22:0], manOne);
  ManReg manReg2(clk, rst, ldM2, floatTwo[22:0], manTwo);
  
  
  wire LE;
  Comprator comp(expOne, expTwo, LE);
  
  wire [22:0] BInput;
  assign BInput = LE ? manOne : manTwo ;
  wire [22:0] AInput;
  assign AInput = !LE ? manOne : manTwo ;
  
  //wire[24:0] B, S;
  //wire [23:0] A;
  BReg bReg(clk, rst, ldRegB, BInput, B);
  ShiftRegA aReg(AInput,clk, rst,shEn, ldRegA, A);
  SReg sReg(clk, rst, ldRegS, A, S);
  
  //wire[24:0] twosOne, twosTwo ;
  TwosComplement twosCompOne(B, signOne, twosOne);
  TwosComplement twosCompTwo(S, signTwo, twosTwo);
  
  //wire[24:0] addAnswer;
  Adder adder(twosOne, twosTwo, addAnswer);
  
  assign floatAns[31] = addAnswer[24];
  
  //wire[24:0] FMInput;
  TwosComplement twosComeFM(addAnswer, addAnswer[24], FMInput);
  
  assign OV = FMInput[23];
  
  wire[23:0] FMOutput;
  ShiftRegFM fmReg(FMInput[23:0], clk, rst, shM, ldFM, FMOutput);
  
  assign floatAns[22:0] = FMOutput[22:0];
  
  //wire[7:0] subAns;
  Subtractor sub(expOne, expTwo, subAns);
  
  Counter counter(subAns, clk, rst, cntEn, ldC, complete);
  
  assign floatAns[30:23] = LE ? (expOne + OV) : (expTwo + OV);
  
  
  
  
endmodule
