module TwosComplement(input[25:0] N, input s, output [25:0] O);
  assign O = s ? (~N[25:0] + 1'b1) : N;
endmodule
