module SFF(input clk, rst, ldF, input N, output O);
	reg o ;
	always@(posedge clk, posedge rst) begin
		if(rst) o <= 1'd0;
		else
			if(ldF) o <= N;
			else o <= o;
	end
	assign O = o;

endmodule
