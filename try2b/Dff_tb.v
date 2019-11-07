`timescale 1ns / 1ps

module Dff_tb;

    // Inputs
    reg clk;
    reg sync;
    reg r;
    reg d;
    reg s;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    Dff_ U7 (
        .clk(clk), 
        .sync(sync), 
        .r(r), 
        .d(d), 
        .s(s), 
        .q(q)
    );

//Clock generation with 100 MHz frequency.
    initial clk = 0;
    always #10 clk =~clk;
    
    initial begin
        //Initialize inputs.
        sync = 0;
        r = 0;
        d = 0;
        s = 0;
        #100;
        //Apply the inputs.
        d=1;
        r = 1; #100;
        r = 0; #100;
        s = 1; #100;
        s = 0; #100;
        sync = 1; #100;
        d = 0;  #100;
        sync = 0; #100;
        d = 1;  #100;
        s = 1; #100;
        s = 0; #100;
    end
      
endmodule
