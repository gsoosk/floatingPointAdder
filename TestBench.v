module TB();
  reg [31:0] Ain = 32'b00111111111000000000000000000000;
  reg [31:0] Bin = 32'b01000000010111001100110011001101;
  reg start = 0;
  reg clk=0;
  reg rst = 1 ;
  wire done;
  wire [31:0] Ans;
   wire signOne, signTwo;
  wire [7:0] expOne, expTwo;
  wire [22:0] manOne, manTwo;
  wire ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM;
  wire[24:0] twosOne, twosTwo ;
  wire[24:0] B, S;
  wire[23:0] A;
  wire complete;
  wire [7:0] subAns;
  wire [24:0] FMInput;
  wire [2:0] ps,ns;
  wire [24:0] addAnswer;
  floatingPointAdder uu1(Ain, Bin, clk, rst, start ,done,  Ans,signOne, signTwo, expOne, expTwo, manOne, manTwo, ldS1, ldS2, ldExp1, ldExp2, ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, shM,twosOne, twosTwo, B, A, S,complete,subAns, FMInput, ps, ns,  addAnswer);
  initial repeat(270) #12 clk=~clk;
  initial begin
    #30 rst=0;
    #50 start=1;
    #70 start=0;
  end  
endmodule
