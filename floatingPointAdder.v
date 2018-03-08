module floatingPointAdder(input [31:0] A, B, input clk, rst, start ,output done, output [31:0] Ans);
  wire ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, OV;
  dataPath DATA_PATH(OV, ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, A, B, clk, rst,  complete, Ans);
  controller CONTROLLER(clk, rst, start, complete, done, ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, OV);
endmodule 
