module BReg(input clk, rst, ldF, input[22:0] N, output  [24:0] O);
	reg [24:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 25'd0;
		else
			if(ldF) o <= {2'b01,N};
			else o <= o;
	end
	assign O = o;

endmodule
