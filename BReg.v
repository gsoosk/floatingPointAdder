module BReg(input clk, rst, ldF, input[22:0] N, output  [25:0] O);
	reg [25:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 26'd0;
		else
			if(ldF) o <= {3'b001,N};
			else o <= o;
	end
	assign O = o;

endmodule
