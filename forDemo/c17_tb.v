`timescale 1ns / 1ps

module c17_tb;
//For all designs:
reg N1,N2,N3,N6,N7;
//For Designs 2-4:
reg clk;
initial clk = 0;
always begin
    #2 clk = 1;
    #8 clk = 0;
end

//For Design 1 (No pipelining):
/*
wire N22,N23;
c17 U1 (N1,N2,N3,N6,N7,N22,N23);
*/

// For Designs 2-3:
wire N22q,N23q;
c17 U1 (N1,N2,N3,N6,N7,N22q,N23q,clk);

// For Design 4 of 4 - Three pipeline stages (at wires N16, N19, and a second at output N23):
/*
wire N22q,N23q2;
reg clk;
c17 U1 (N1,N2,N3,N6,N7,N22q,N23q2,clk);
*/

initial // initial block executes only once
    begin
    #0.5;
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
    end
endmodule
