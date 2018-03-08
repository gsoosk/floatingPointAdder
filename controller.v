module controller(input clk, rst, input start, complete, output done, output reg ldS1, ldS2, ldExp1, ldExp2, 
  ldM1, ldM2, ldRegA, ldRegB, ldRegS, shEn, cntEn, ldC, ldFM, OV);
  parameter [2:0] IDLE = 3'b0, STARTING = 3'b001, LOAD_INPUTS = 3'b010, LOAD_AB = 3'b011, SHIFTING = 3'b100, LOAD_FM = 3'b101
  ,OVERFLOW_HANDLE = 3'b110, LOAD_S = 3'b111 ;
  reg [2:0] ps,ns;

  always @(posedge clk, start, complete, OV) begin
    ns = 3'b0;
    case(ps)
      IDLE : ns = start ? STARTING : IDLE;
      STARTING : ns = start ? STARTING : LOAD_INPUTS;
      LOAD_INPUTS : ns = LOAD_AB;
      LOAD_AB : ns = SHIFTING ;
      SHIFTING : ns = complete ? LOAD_S: SHIFTING;
      LOAD_S : ns = LOAD_FM;
      LOAD_FM : ns = OVERFLOW_HANDLE;
      OVERFLOW_HANDLE : ns = IDLE;
      default : ns = IDLE;
    endcase
  end
  
  reg Done;
  always @(ps) begin
    Done=0;
    ldS1=0; ldS2=0; ldExp1=0; ldExp2=0; ldM1=0; ldM2=0; ldRegA=0; ldRegB=0; ldRegS=0; shEn=0; cntEn=0; ldC=0; ldFM=0; OV=0;
    case(ps)
      IDLE : Done=1;
      LOAD_INPUTS : begin ldS1=1; ldS2=1; ldExp1=1; ldExp2=1; ldM1=1; ldM2=1;  end
      LOAD_AB : begin  ldRegA=1; ldRegB=1; ldC=1; end
      SHIFTING : begin shEn=1; cntEn=1; end
      LOAD_S : begin ldRegS = 1; end
      LOAD_FM : begin ldFM=1; end
      OVERFLOW_HANDLE : begin OV = 1; end
      default : begin
        ldS1=0; ldS2=0; ldExp1=0; ldExp2=0; ldM1=0; ldM2=0; ldRegA=0; ldRegB=0; ldRegS=0; shEn=0; cntEn=0; ldC=0; ldFM=0; OV=0;
      end
    endcase
  end
  assign done = Done;
  
  
  always @(posedge clk,posedge rst) begin
    if(rst) ps <= 3'b0;
    else ps <= ns;
  end
  
endmodule

