module TwosComplement(input[24:0] N, input s, output [24:0] O);
  assign O = s ? (~N[24:0] + 1'b1) : N;
endmodule