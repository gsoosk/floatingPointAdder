module SReg(input clk, rst,ldF, input[23:0] N, output [25:0] O);
	reg [25:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 25'd0;
		else
			if(ldF) o <= {2'b00,N};
			else o <= o;
	end
	assign O = o;

endmodule
