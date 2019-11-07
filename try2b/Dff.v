`timescale 1ns / 1ps

module Dff_(
    input clk,sync,r,d,s,
    output q);

reg q;

always @(posedge clk) begin
    if(clk == 1) 
        begin
            if (r == 1) q = 0;  
            else if(s == 1) q = 1; 
        else if (sync == 1) q = d;    
        end      
end

endmodule
