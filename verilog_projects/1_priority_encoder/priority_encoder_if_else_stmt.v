module priority_encoder (
  input  [3:0] a,
  output reg [1:0] y
);

  always @(*) begin
    if (a[3] == 1'b1)
      y = 2'd3;
    else if (a[2] == 1'b1)
      y = 2'd2;
    else if (a[1] == 1'b1)
      y = 2'd1;
    else
      y = 2'd0;
  end

endmodule
