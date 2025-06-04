module edge_detector(
  input i_a,
  input i_rst,
  input i_clk,
  output o_out
);
  reg out1;
  
  always @ (posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
      out1 <= 1'b0;
    end     
    else begin
      out1 <= i_a; 
    end
  end 
  
  assign o_out = ~out1 & i_a;
endmodule