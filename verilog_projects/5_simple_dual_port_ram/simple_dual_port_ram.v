module simple_dual_port_ram(
  input i_clk,
  input i_rst,
  input i_rd_en,
  input [9:0] i_rd_addr,
  output [31:0] o_dout
  );
  
  reg ena;
  reg wea;
  reg [9:0] addra;
  wire [31:0] dina;
  
mem_sdpr i_sdpr (
  .clka(i_clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [9 : 0] addra
  .dina(dina),    // input wire [31 : 0] dina
  .clkb(i_clk),    // input wire clkb
  .enb(i_rd_en),      // input wire enb
  .addrb(i_rd_addr),  // input wire [9 : 0] addrb
  .doutb(o_dout)  // output wire [31 : 0] doutb
);

always @(posedge i_clk) begin
  if (i_rst) begin
    ena <= 1'd0;
    wea <= 1'd0;
    addra <= 1'd0;
  end 
  else if (dina == 10'd1023) begin
    ena <= 1'd0;
    wea <= 1'd0; 
    addra <=1'd0;
  end 
  else begin 
    ena <= 1'd1;
    wea <= 1'd1;
    addra <= addra + 1'd1;
  end 
end 

assign dina = addra;
 
endmodule