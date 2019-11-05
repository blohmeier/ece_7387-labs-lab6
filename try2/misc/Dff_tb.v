`timescale 1ns / 1ps

module Dff_tb();
        parameter clkFreq=40; // 40 MHz clock frequency
        parameter clkPd = 1 / clkFreq; //25ns period (for 40 MHz)
        
        reg clk,din,r,s;
        wire dout;
        
    initial clk = 1;
    always
        begin : CLOCK
            #(clkPd * 0.20) clk = 0;
            #(clkPd * 0.80) clk = 1;
        end
Dff U4 (clk,din,r,s,dout);
    initial
        begin
        // initialize q to 0 for asynchronous block testing (async test is from 60 ns to 100 ns)
        #8; // 60 ns
        r=0;
        s=1;
        din=0;
        #0.5;
        clk=1;
        #0.5; // 61 ns
        clk=0;
        #1; // 62 ns
        din=1;
        #4; // 66 ns
        din=0;
        #2; // 68 ns
        r=1;
        #4; // 72 ns
        r=0;
        #5; // 77 ns
        s=0;
        #3; // 80 ns
        s=1;
        #2; // 82 ns
        s=0;
        #8; // 90 ns
        s=1;
        end
endmodule
