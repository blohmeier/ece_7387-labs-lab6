`timescale 1ns / 1ps

module Dff(
    input clk,din,r,s,
    output dout);

reg q;

always @(posedge clk or posedge r or negedge s)
begin
    if (r) q <= 1'b0;
    else if (!s) q <= 1'b1;
    else q <= din;
end
assign dout = q;
endmodule
