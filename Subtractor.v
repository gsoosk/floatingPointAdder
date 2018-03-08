module Subtractor(input[7:0] N1, N2, output [7:0] Answer);
  wire [7:0] X1, X2;
  assign X1 = N1 - 7'b1111111 ;
  assign X2 = N2 - 7'b1111111 ;
  assign semiAns = (X1[7]==0 && X2[7]==0 && X2>X1) ? X2 - X1 :  (X1[7]==0 && X2[7]==0 && X1>X2) ? X1-X2 : (X1[7]==1 && X2[7]==0) ? (~X1+1'b1) + X2 : (X1[7]==0 && X2[7]==1) ? (~X2+1'b1) + X1 : 0; 
  assign Answer = semiAns;
endmodule
