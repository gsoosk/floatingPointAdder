module MultiplexerMan(input select, input [22,0] Man1, Man2, output reg [22,0] O);
  assign O = select ? Man2 : Man1;
endmodule
