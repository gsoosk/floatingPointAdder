module OverflowHandle(input [25:0] fmInput, input OVSignal, input [7:0]expInput, output reg [22:0] Man, output reg [7:0] exp);
  reg [25:0] fm;
  reg [7:0] expReg;
  
  always @ ( * ) begin
    fm <= fmInput;
    expReg <= expInput;
    if(OVSignal) begin
      if(fmInput[24:23] == 2'b10 || fmInput[24:23] == 2'b11) begin
        Man = {1'b0,fmInput[22:1]};
        exp = expInput + 1'b1;
      end
      
      if(fmInput[24:23] == 2'b01) begin
        Man = fmInput[22:0];
        exp = expInput;
      end
      if(fmInput[24:23] == 2'b00)begin
        if(fmInput[22:0] == 23'b0) begin
          Man = fmInput[22:0];
          exp = expInput;
        end
        else begin
          
          while(fm[23] == 1'b0) begin
            fm = {fm[24:0],1'b0};
            Man = fm[22:0];
            expReg = expReg - 1'b1;
          end
        end
      end
    end
    
  exp <= expReg;
  end
  
endmodule 
