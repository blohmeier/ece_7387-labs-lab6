`timescale 1ns / 1ps

module Dff_tb;
reg clk,sync,r,d,s;
wire q;

Dff_ U7 (.clk(clk),.sync(sync),.r(r),.d(d),.s(s),.q(q));
initial clk = 0;
always #5 clk =~clk;
initial begin
    sync = 0; r = 0; d = 0; s = 0;
    #50;
    d=1;
    r=1; 
    #50;
    r=0;
    #100;
    s=1;
    #100;
    s=0; 
    #100;
    sync = 1; 
    #100;
    d = 0;
    #100;
    sync = 0;
    #100;
    d = 1;
    #100;
    s = 1;
    #100;
    s = 0;
    #100;
end
endmodule
