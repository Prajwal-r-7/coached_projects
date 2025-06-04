module tb_param_counter();

  //-------------------------------
  // Testbench signals
  //-------------------------------
  localparam MOD = 100000;
  localparam TP = 10;
  reg                   i_rst;
  reg                   i_clk;
  logic [$clog2(MOD):0] o_count;

  //-------------------------------
  // Testbench Logic
  //-------------------------------
  initial begin
    i_clk=1'b1;
    o_count=1'b0; 
  end
  
  always i_clk = #TP ~i_clk;
  
  
  initial begin
    i_rst = 1'b1;   
	#15
	i_rst = 1'b0;
  end
  
  //-------------------------------
  // DUT
  //-------------------------------
  param_counter #(
  .MOD(MOD)
  )
  dut_param_counter(
    .i_rst(i_rst),
    .i_clk(i_clk),
	.o_count(o_count)
  );
endmodule