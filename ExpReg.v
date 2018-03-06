module ExpReg(input clk, rst, ldF, input[7:0] N, output  [7:0] O);
	reg [7:0] o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 8'd0;
		else
			if(ldF) o <= N;
			else o <= o;
	end
	assign O = o;

endmodule
