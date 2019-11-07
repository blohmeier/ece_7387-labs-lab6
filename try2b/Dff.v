`timescale 1ns / 1ps

module Dff_(
    input clk,sync,r,d,s,
    output q);

reg q;

always @(posedge clk or posedge r or posedge s or posedge sync) begin
    if(r == 1) q = 0;
    else if(s == 1) q = 1; 
    else if (clk == 1 && sync == 1) q = d;
end

endmodule
