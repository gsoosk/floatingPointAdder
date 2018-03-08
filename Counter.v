module Counter(input[7:0] n, input clk, rst, cen, ldC, output complete);
  reg[7:0] s;
  always@(posedge clk, posedge rst) begin
  if (ldC == 1)
    s <= n;
    else begin
      if(cen == 1 && s>0)
        s <= s - 1'b1;
      else
        s <= s;
    end
  end

  assign complete = (s>1) ? 0 : 1;

endmodule


module counterTB();
  
  reg [7:0] n = 8'b00000001;
  reg clk=0;
  reg rst = 1 ;
  reg cen = 0 ;
  reg ldC = 0;
  wire complete;
  Counter uut( n, clk, rst, cen, ldC, complete);
  
  
  
  initial repeat(270) #12 clk=~clk;
  initial begin
    #30 rst=0;
    #50 ldC=1;
    #70 ldC=0;
    #90 cen=1;
  end  
endmodule 