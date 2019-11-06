`timescale 1ns / 1ps

module c17(N1,N2,N3,N6,N7,N22,N23
,clk);

input N1,N2,N3,N6,N7,clk;

output N22,N23;

wire N10,N11,N16,N19;

// No pipelining
/*
nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);
*/

// Single stage pipeline (at inputs and outputs)
wire N1b,N3b1,N3b2,N6b,N2b,N7b;
wire din,r,s,dOut;

nand NAND2_1 (N10, N1b, N3b1);
nand NAND2_2 (N11, N3b2, N6b);
nand NAND2_3 (N16, N2b, N11);
nand NAND2_4 (N19, N11, N7b);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);

// Register inputs to NAND2_1
Dff_ U2 (.clk(clk),.dIn(N1),.r(r),.s(s),.dOut(N1b));
Dff_ U3 (.clk(clk),.dIn(N3),.r(r),.s(s),.dOut(N3b1));
// Register inputs to NAND2_2
Dff_ U4 (.clk(clk),.dIn(N3),.r(r),.s(s),.dOut(N3b2));
Dff_ U5 (.clk(clk),.dIn(N6),.r(r),.s(s),.dOut(N6b));
// Register input to NAND2_3
Dff_ U6 (.clk(clk),.dIn(N2),.r(r),.s(s),.dOut(N2b));
// Register input to NAND2_4
Dff_ U7 (.clk(clk),.dIn(N7),.r(r),.s(s),.dOut(N7b));

// Two pipeline stages (additionally at wires N10 and N11)
/*
reg N1NAND2_1,N2NAND2_3,N3NAND2_1,N3NAND2_2,N6NAND2_2,N7NAND2_4;
reg NAND2_5N22,NAND2_5N23;
*/

// Three pipeline stages (additionally at wires N16 and N19)
/* 
*/

endmodule
