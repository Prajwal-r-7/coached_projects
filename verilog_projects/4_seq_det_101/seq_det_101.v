module seq_det_101 #(
  parameter idle = 2'd0,
  parameter got_1 = 2'd1,
  parameter got_10 = 2'd2
)(
  input i_a,
  input i_clk,
  input i_rst,
  output reg o_y,
  output reg [1:0] pres_state,
  output reg [1:0] next_state
  );
  
  // Input Synchronizer (1-stage delay)
  reg sync_a;

  always @(posedge i_clk or posedge i_rst) begin
    if (i_rst)
      sync_a <= 1'b0;
    else
      sync_a <= i_a;
  end
  
  // Present State Logic 
  
  always @(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
	  pres_state <= 2'd0;
	end 
	else begin 
	  pres_state <= next_state;
	end
  end 
  
  // Next State Logic
  
  always @(*) begin
    if (i_rst) begin
	  next_state <= 2'd0;
	end
    else begin 
	case (pres_state)
	  idle : begin 
	    if (sync_a == 1'b1) begin
		  next_state = got_1;
		  o_y = 1'b0;
		end 
		else begin 
		  next_state = idle;
		  o_y = 1'b0;
		end 
	  end
		
	  got_1 : begin 
	    if (sync_a == 1'b0) begin
		  next_state = got_10;
		  o_y = 1'b0;
		end 
		else begin 
		  next_state = got_1;
		  o_y = 1'b0;
		end 
	  end	
	  
	  got_10 : begin 
	    if (sync_a == 1'b1) begin
		  next_state = idle;
		  o_y = 1'b1;
		end 
		else begin 
		  next_state = idle;
		  o_y = 1'b0;
		end
      end		
	endcase
	end
	end
endmodule