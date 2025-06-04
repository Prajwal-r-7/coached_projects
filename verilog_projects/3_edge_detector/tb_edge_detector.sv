module tb_edge_detector();

  //-------------------------------
  // Testbench signals
  //-------------------------------
  reg i_clk = 1;
  reg i_a = 0;
  reg i_rst = 1;
  logic o_out;
  
  //-------------------------------
  // Testbench Logic
  //-------------------------------
   parameter PERIOD = 10;

   initial begin
      i_clk = 1'b0;
      #(PERIOD/2);
      forever
         #(PERIOD/2) i_clk = ~i_clk;
   end

  initial begin
    i_rst <= 1'b1;
    i_a <= 1'b0;
    #60;
    @(posedge i_clk);
    i_rst <= 1'b0;
    repeat(10) begin
     @(posedge i_clk);
     i_a <= $urandom_range(1,0);
    end 
  end 
   
   
  //-------------------------------
  // DUT
  //-------------------------------
  edge_detector dut(
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_a(i_a),
    .o_out(o_out)
  );

endmodule
