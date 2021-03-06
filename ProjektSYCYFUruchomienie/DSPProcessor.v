module DSPprocessor(
	input ena,
	input rst,
	input clk,

	input signed[7:0] rec,
	
	output signed[13:0] tim,
	output rdy
);

wire clk0;
wire signed[23:0] lout;
wire signed[13:0] ltim;
wire detect;

korelator kor(.ena(ena),.rst(rst),.clk(clk),.rec(rec),.out(lout),.clk0(clk0));
timer tima(.ena(ena),.rst(rst),.clk(clk0),.tim(ltim));

detector detec(.in(lout),.out(detect));

myOut outm(.ena(ena),.rst(rst),.clk(clk),.in(ltim),.detect(detect),.rdy(rdy),.out(tim));

endmodule
