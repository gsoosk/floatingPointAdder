module Subtractor(input[7:0] N1, N2, output [7:0] Answer);
  wire [7:0] X1, X2;
  assign X1 = N1 - 7'b1111111 ;
  assign X2 = N2 - 7'b1111111 ;
  wire [7:0] semiAns;
  assign semiAns = X1 + X2 ;
  assign Answer = semiAns[7] ? (~semiAns + 1'b1) : semiAns ;
endmodule
