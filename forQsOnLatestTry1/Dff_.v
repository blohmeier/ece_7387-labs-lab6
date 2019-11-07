`timescale 1ns / 1ps

module Dff_(
    input clk,sync,r,d,s,
    output q);

reg q_reg;

always @(posedge clk or posedge r or posedge s or posedge sync) begin
    if(r == 1) q_reg = 0;
    else if(s == 1) q_reg = 1; 
    else if (clk == 1 && sync == 1) q_reg = d;
end
assign q=q_reg;
endmodule
