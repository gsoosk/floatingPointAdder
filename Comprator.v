module Comprator(input [7:0] e1, e2, output LE);
  assign LE = (e1 < e2) ? 0 : 1;
endmodule
