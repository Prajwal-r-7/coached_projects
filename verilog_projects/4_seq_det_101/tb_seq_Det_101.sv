module tb_seq_Det_101 ();

  //-------------------------------
  // Testbench signals
  //-------------------------------
  localparam idle = 2'd0;
  localparam got_1 = 2'd1;
  localparam got_10 = 2'd2;

  reg i_clk;
  reg i_rst;
  reg i_a;
  logic o_y = 1'b0;
  logic [1:0] pres_state;
  logic [1:0] next_state;

  //-------------------------------
  // Testbench Logic
  //-------------------------------
  initial begin 
    i_clk = 1'b0;
	i_rst = 1'b1;
	#15
	i_rst = 1'b0;
  end
  
  always i_clk = #5 ~i_clk;
  
  initial begin 
	i_a = 1'b0;
	#15
	i_a = 1'b0;
	#10
	i_a = 1'b1;
	#10
	i_a = 1'b0;
	#10
	i_a = 1'b1;
	#10
	i_a = 1'b0;
	#10
	i_a = 1'b1;
	#10
	i_a = 1'b0;
	#10
	i_a = 1'b1;
	#10
	i_a = 1'b0;
	#10
	i_a = 1'b1;	
	#50
	$finish;
  end
  
   
  //-------------------------------
  // DUT
  //-------------------------------
  seq_det_101 #(
  .idle(idle),
  .got_1(got_1),
  .got_10(got_10)
  ) 
  dut (
  .i_a(i_a),
  .i_clk(i_clk),
  .i_rst(i_rst),
  .o_y(o_y),
  .pres_state(pres_state),
  .next_state(next_state)
  );
	
endmodule