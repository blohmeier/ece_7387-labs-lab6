`timescale 1ns / 1ps

module c17(N1,N2,N3,N6,N7,N22,N23,clk,dIn,r,s,dOut);

input N1,N2,N3,N6,N7,clk,dIn,r,s;

output N22,N23,dOut;

wire N10,N11,N16,N19;

// No pipelining

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);

// Single stage pipeline (at inputs and outputs)
wire N1a,N1b,N3a,N3b;
reg N1NAND2_1,N2NAND2_3,N3NAND2_1,N3NAND2_2,N6NAND2_2,N7NAND2_4;
reg NAND2_5N22,NAND2_5N23;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);


// Single stage pipeline (at inputs and outputs)
reg N1NAND2_1,N2NAND2_3,N3NAND2_1,N3NAND2_2,N6NAND2_2,N7NAND2_4;
reg NAND2_5N22,NAND2_5N23;

Dff_ U2 (.clk(clk),.dIn(N1),.r(r),.s(s),.dOut(N10));
Dff_ U3 (.clk(clk),.dIn(N3),.r(r),.s(s),.dOut(N10));

Dff_ U4 (.clk(clk),.dIn(N3),.r(r),.s(s),.dOut(N10));
Dff_ U5 (.clk(clk),.dIn(N2),.r(r),.s(s),.dOut(N16));

Dff_ U2 (.clk(clk),.dIn(N1),.r(r),.s(s),.dOut(N10));
Dff_ U3 (.clk(clk),.dIn(N3),.r(r),.s(s),.dOut(N10));

/* Two pipeline stages (additionally at wires N10 and N11)

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, NAND2_1q, N16);
nand NAND2_6 (N23, N16, N19);

// Single stage pipeline (at inputs and outputs)
always @ (posedge clk) begin
    NAND2_1q <= N10; //dff on N10 wire
end */

endmodule
