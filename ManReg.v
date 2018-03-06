module ManReg(input clk, rst, ldF, input[22:0] N, output  [22:0] O);
	reg [22:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 23'd0;
		else
			if(ldF) o <= N;
			else o <= o;
	end
	assign O = o;

endmodule
