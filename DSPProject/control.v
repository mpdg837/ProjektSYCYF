module control(
	input clk,
	input rst,
	input ena,
	
	input det,
	input signed[13:0] tim,
	
	output signed[13:0] out_tim,
	output out_clk,
	output out_rst,
	output out_det,
	output out_ena
	
);

assign out_clk = (clk==1) ? 1 : 0;
assign out_rst = (rst==1) ? 1 : 0;
assign out_det = (det==1) ? 1 : 0;
assign out_ena = (ena==1) ? 1 : 0;

assign out_tim = tim - 20;

endmodule
