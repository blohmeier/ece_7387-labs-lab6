`timescale 1ns / 1ps

module c17(N1,N2,N3,N6,N7,N22,N23,clk);

input N1,N2,N3,N6,N7,clk;

output N22,N23;

wire N10,N11,N16,N19;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);


// Single stage pipeline (at inputs and outputs)
reg N1NAND2_1,N2NAND2_3,N3NAND2_1,N3NAND2_2,N6NAND2_2,N7NAND2_4;
reg NAND2_5N22,NAND2_5N23;

always @ (posedge clk) begin
    N1NAND2_1 <= N1;    //  dff on N1 input to NAND2_1
    N3NAND2_1 <= N3;    //  dff on N3 input to NAND2_1
    N3NAND2_2 <= N3;    //  dff on N3 input to NAND2_2
    N6NAND2_2 <= N6;    //  dff on N6 input to NAND2_2
    N2NAND2_3 <= N2;    //  dff on N2 input to NAND2_3
    N7NAND2_4 <= N7;    //  dff on N7 input to NAND2_4
end

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
