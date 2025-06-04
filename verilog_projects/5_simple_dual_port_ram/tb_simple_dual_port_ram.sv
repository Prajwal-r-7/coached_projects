module tb_simple_dual_port_ram();

  //-------------------------------
  // Testbench signals
  //-------------------------------
  reg i_clk;
  reg i_rst;
  reg i_rd_en;
  reg [9:0] i_rd_addr;
  logic [31:0] o_dout;
  integer i;
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
     i_rst = 1'd1;
     i_rd_en = 1'd0;
     i_rd_addr = 1'd0;
     #15;
     
     i_rst = 1'd0;
     #35;
     
     i_rd_en = 1'b1;
     for (i=0; i<1024; i=i+1) begin
       i_rd_addr = i;
       #10;
     end
   end 
    
  //-------------------------------
  // DUT
  //-------------------------------
 simple_dual_port_ram dut(
 .i_clk(i_clk),
 .i_rst(i_rst),
 .i_rd_en(i_rd_en),
 .i_rd_addr(i_rd_addr),
 .o_dout
 );
    
  
endmodule