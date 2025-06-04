module priority_encoder(
  input [3:0] a,
  output [1:0] y
);
  // priority output assignment
  assign y = (a[3] == 1'b1)? 4'd3:
             (a[2] == 1'b1)? 4'd2:
			 (a[1] == 1'b1)? 4'd1:
			 4'd0;
endmodule