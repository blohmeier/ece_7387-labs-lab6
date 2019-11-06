`timescale 1ns / 1ps

module c17_tb;
        reg N1,N2,N3,N6,N7;
        wire N22,N23;

        //parameter clkFreq=40; // 40 MHz clock frequency
        //parameter clkPd = 1 / clkFreq; //25ns period (for 40 MHz)
        
        reg clk;
 
    always
        #5 clk = !clk;
        /*begin : CLOCK
            #(clkPd * 0.20) clk = 0;
            #(clkPd * 0.80) clk = 1;
        end*/

c17 U1 (.N1(N1),.N2(N2),.N3(N3),.N6(N6),.N7(N7),.N22(N22),.N23(N23));

initial // initial block executes only once
    begin
    clk=0;
    // 1-4 of 32 test vectors (all of inputs N2 and N1)
    N7=0;   N6=0;   N3=0;   N2=0;   N1=0;
    #20; //   
    N7=0;   N6=0;   N3=0;   N2=0;   N1=1;
    #20; //
    N7=0;   N6=0;   N3=0;   N2=1;   N1=0;
    #20; //
    N7=0;   N6=0;   N3=0;   N2=1;   N1=1;
    #20; //
    // 5-8 of 32 test vectors (adding input N3)
    N7=0;   N6=0;   N3=1;   N2=0;   N1=0;
    #20; //   
    N7=0;   N6=0;   N3=1;   N2=0;   N1=1;
    #20; //
    N7=0;   N6=0;   N3=1;   N2=1;   N1=0;
    #20; //
    N7=0;   N6=0;   N3=1;   N2=1;   N1=1;
    #20; //
    // 9-16 of 32 test vectors (adding input N6)     
    N7=0;   N6=1;   N3=0;   N2=0;   N1=0;
    #20; //   
    N7=0;   N6=1;   N3=0;   N2=0;   N1=1;
    #20; //
    N7=0;   N6=1;   N3=0;   N2=1;   N1=0;
    #20; //
    N7=0;   N6=1;   N3=0;   N2=1;   N1=1;
    #20; //
    N7=0;   N6=1;   N3=1;   N2=0;   N1=0;
    #20; //   
    N7=0;   N6=1;   N3=1;   N2=0;   N1=1;
    #20; //
    N7=0;   N6=1;   N3=1;   N2=1;   N1=0;
    #20; //
    N7=0;   N6=1;   N3=1;   N2=1;   N1=1;
    #20; //
    // 17-32 of 32 test vectors (adding input N7)
    N7=1;   N6=0;   N3=0;   N2=0;   N1=0;
    #20; //   
    N7=1;   N6=0;   N3=0;   N2=0;   N1=1;
    #20; //
    N7=1;   N6=0;   N3=0;   N2=1;   N1=0;
    #20; //
    N7=1;   N6=0;   N3=0;   N2=1;   N1=1;
    #20; //
    N7=1;   N6=0;   N3=1;   N2=0;   N1=0;
    #20; //   
    N7=1;   N6=0;   N3=1;   N2=0;   N1=1;
    #20; //
    N7=1;   N6=0;   N3=1;   N2=1;   N1=0;
    #20; //
    N7=1;   N6=0;   N3=1;   N2=1;   N1=1;
    #20; // 
    N7=1;   N6=1;   N3=0;   N2=0;   N1=0;
    #20; //   
    N7=1;   N6=1;   N3=0;   N2=0;   N1=1;
    #20; //
    N7=1;   N6=1;   N3=0;   N2=1;   N1=0;
    #20; //
    N7=1;   N6=1;   N3=0;   N2=1;   N1=1;
    #20; //
    N7=1;   N6=1;   N3=1;   N2=0;   N1=0;
    #20; //   
    N7=1;   N6=1;   N3=1;   N2=0;   N1=1;
    #20; //
    N7=1;   N6=1;   N3=1;   N2=1;   N1=0;
    #20; //
    N7=1;   N6=1;   N3=1;   N2=1;   N1=1;
    #20; //
    
        #8; // 60 ns
        //r=0;
        //s=1;
        #0.5;
        clk=1;
        #0.5; // 61 ns
        clk=0;
        #1; // 62 ns
        #4; // 66 ns
        #2; // 68 ns
        //r=1;
        #4; // 72 ns
        //r=0;
        #5; // 77 ns
        //s=0;
        #3; // 80 ns
        //s=1;
        #2; // 82 ns
        //s=0;
        #8; // 90 ns
        //s=1;
        end
endmodule
