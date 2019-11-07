`timescale 1ns / 1ps

module Dff_tb;
reg clk,sync,r,d,s;
wire q;

Dff_ U7 (.clk(clk),.sync(sync),.r(r),.d(d),.s(s),.q(q));
initial clk = 0;
always #5 clk =~clk; // 5 cycles per 100 ns; 1 cycle per 20 ns.
initial begin
    sync=0; r=0; d=0; s=0; // At 0 ns, initialize syncronous enable, r, d and s values. 
    #20; d=1; r=1;  // 20 ns have passed. Due to r=1 and s=0, no output on q despite d=1.
    #20; r=0;  // 40 ns. Due to s=0, no output on q despite d=1. 
    #20; s=1;  // 60 ns. q=1. 
    #20; s=0; //  80 ns. q remains 1 because sync isn't enabled and no r=1
    #20; sync=1; //  100 ns. q must now reflext state of d.
    #20; d=0; //  120 ns. q=0.
    #20; sync=0; //  140 ns. q no longer reflects state of d.
    #20; d=1; //  160 ns.
    #20; s=1; //  180 ns.
    #20; s=0; //  200 ns.
    #20; //  220 ns.
end
endmodule
