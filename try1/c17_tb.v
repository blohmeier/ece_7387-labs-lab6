`timescale 1ns / 1ps

// testbench for c17.v has 5 inputs thus 32 possibilities (requiring 32 test vectors)
module c17_tb();
reg clk;
reg N1,N2,N3,N6,N7;
wire N22,N23;

c17 U1(.N1(N1),.N2(N2),.N3(N3),.N6(N6),.N7(N7),.N22(N22),.N23(N23));
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
    end 

    always 
        #5  clk =  ! clk; 
endmodule
