module ShiftRegFM(input [23:0] pi, input clk, rst, shiftEnable, Lden, output reg [23:0] sout);
  always @ ( posedge clk , posedge rst ) begin
    if(rst) sout <= 24'b0;
    else
      if(Lden) sout<=pi;
      else
        if(shiftEnable) sout <= {1'b0,sout[23:1]};
        else sout <= sout;
  end
endmodule
