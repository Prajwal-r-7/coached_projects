module param_counter #(
  parameter MOD = 100000
)(
  input                       i_clk,
  input                       i_rst,
  output reg [$clog2(MOD)-1:0]o_count
);

  always @(posedge i_clk) begin
    if (i_rst) begin
	  o_count <= {$clog2(MOD){1'd0}};
	end
	else if (o_count == MOD-1) begin
	  o_count <= {$clog2(MOD){1'd0}}; 
	end
	else 
	  o_count <= o_count + 1'd1;
  end
endmodule