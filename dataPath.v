module dataPath(input OV, ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM,
  input[31:0] floatOne, floatTwo, input clk, rst, output complete, output[31:0] floatAns);
  wire signOne, signTwo;
  SFF S1(clk, rst, ldS1, floatOne[31], signOne);
  SFF S2(clk, rst, ldS2, floatTwo[31], signTwo);
  
  wire [7:0] expOne, expTwo;
  ExpReg expReg1(clk, rst, ldExp1, floatOne[30:23], expOne);
  ExpReg expReg2(clk, rst, ldExp2, floatTwo[30:23], expTwo);
  
  wire [22:0] manOne, manTwo;
  ManReg manReg1(clk, rst, ldM1, floatOne[22:0], manOne);
  ManReg manReg2(clk, rst, ldM2, floatTwo[22:0], manTwo);
  
  
  wire LE;
  Comprator comp(expOne, expTwo, LE);
  
  wire [22:0] BInput;
  assign BInput = LE ? manOne : manTwo ;
  wire [22:0] AInput;
  assign AInput = !LE ? manOne : manTwo ;
  
  wire[25:0] B, S;
  wire [23:0] A;
  BReg bReg(clk, rst, ldRegB, BInput, B);
  ShiftRegA aReg(AInput,clk, rst,shEn, ldRegA, A);
  SReg sReg(clk, rst, ldRegS, A, S);
  
  wire[25:0] twosOne, twosTwo ;
  TwosComplement twosCompOne(B, signOne, twosOne);
  TwosComplement twosCompTwo(S, signTwo, twosTwo);
  
  wire[25:0] addAnswer;
  Adder adder(twosOne, twosTwo, addAnswer);
  
  assign floatAns[31] = addAnswer[25];
  
  wire[25:0] FMInput;
  TwosComplement twosComeFM(addAnswer, addAnswer[25], FMInput);
  
  
  wire [7:0] outExpBefore ;
  assign outExpBefore = LE ? (expOne ) : (expTwo);
  
  wire [22:0] manOut;
  wire [7:0] outExpAfter;
  OverflowHandle ovHandle(FMInput, OV, outExpBefore, manOut, outExpAfter);
  
  assign floatAns[22:0] = manOut;
  assign floatAns[30:23] = outExpAfter;
  
  wire[7:0] subAns;
  Subtractor sub(expOne, expTwo, subAns);
  
  Counter counter(subAns, clk, rst, cntEn, ldC, complete);
  
endmodule

