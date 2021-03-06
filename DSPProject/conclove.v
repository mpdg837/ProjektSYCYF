module conclove(
	input clk,
	input rst,
	input[4:0] tim,
	
	input signed[7:0] sel_sig,
	output signed [9:0] con,
	output rdy
);

reg signed[23:0] r_con;
reg signed[23:0] n_con;
reg signed[23:0] s_con;

reg s_rdy;

always@(posedge clk, posedge rst)begin
	if(rst) r_con <= 0;
	else r_con <= n_con;
end

always@(*)begin

	n_con = r_con;
	s_con = 16'b0;
	s_rdy = 0;
	
	case(tim)
		5'd0: n_con = $signed(sel_sig *$signed(8'b00000000));
		5'd1: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b00100111)));
		5'd2: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01001011)));
		5'd3: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01100111)));
		5'd4: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01111001)));
		5'd5: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01111111)));
		5'd6: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01111001)));
		5'd7: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01100111)));
		5'd8: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b01001011)));
		5'd9: n_con = $signed(r_con + $signed(sel_sig * $signed(8'b00100111)));
		5'd10: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b00000000)));
		5'd11: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b11011001)));
		5'd12: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10110101)));
		5'd13: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10011001)));
		5'd14: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10000111)));
		5'd15: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10000001)));
		5'd16: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10000111)));
		5'd17: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10011001)));
		5'd18: n_con = $signed(r_con + $signed(sel_sig *$signed(8'b10110101)));
		5'd19: begin
					s_con = r_con + (sel_sig *$signed(8'b11011001));
					s_rdy = 1;
					
				end
		default:;
	endcase
end

assign rdy = s_rdy;
assign con = s_con[23:14];

endmodule
