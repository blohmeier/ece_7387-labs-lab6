`timescale 1ns / 1ps

module Dff_tb;
reg clk,sync,r,d,s;
wire q;

Dff_ U7 (.clk(clk),.sync(sync),.r(r),.d(d),.s(s),.q(q));
initial clk = 0;
always #5 clk =~clk; // 5 cycles per 100 ns; 1 cycle per 20 ns.
initial begin
    sync=0; r=1; d=0; s=0; // At 0 ns, initialize values. 
    #20; d=1;  // 20 ns have passed. Due to r=1, no output on q despite d=1.
    #20; r=0;  // 40 ns. Due to s=0, no output on q despite d=1. 
    #20; r=1;  // 60 ns. q=1. 
    #20; s=1; //  80 ns. q remains 1 because sync isn't enabled and no r=1
    #20; s=0; //  100 ns. q must now reflext state of d.
    #20; r=0; //  120 ns. q=0.
    #20; s=1; //  140 ns. q no longer reflects state of d.
    #20; s=0; //  160 ns.
    #20; sync=1; //  180 ns.
    #20; d=0; //  200 ns.
    #20; d=1; //  220 ns.
    #20; r=1; //  240 ns.
    #20; r=0; //  260 ns.
end
endmodule
