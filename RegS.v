module SReg(input clk, rst,ldF, input[23:0] N, output [24:0] O);
	reg [24:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 25'd0;
		else
			if(ldF) o <= {1'b0,N};
			else o <= o;
	end
	assign O = o;

endmodule