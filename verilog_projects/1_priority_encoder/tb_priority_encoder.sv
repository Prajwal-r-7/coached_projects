module tb_priority_encoder();
  //-------------------------------
  // Testbench signals
  //-------------------------------
  reg [3:0] a;
  logic [1:0] y;
  
  //-------------------------------
  // Testbench Logic
  //-------------------------------
  initial begin
	repeat (20) begin
	  a = $urandom_range(0, 15);
	  #10;
	end
  end
  
  //-------------------------------
  // DUT
  //-------------------------------
  priority_encoder dut_priority_encoder(
    .a(a),
    .y(y)
  );
endmodule