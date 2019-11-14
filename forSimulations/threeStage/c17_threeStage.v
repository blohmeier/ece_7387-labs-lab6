`timescale 1ns / 1ps

//Design 4 of 4 - Three pipeline stages (additionally at wires N16, N19, and a second at output N23)
module c17(N1,N2,N3,N6,N7,N22q,N23q2,clk);
input N1,N2,N3,N6,N7,clk;
output N22q,N23q2;
reg N1q,N3q,N6q,N2q,N7q,N22q,N10q,N11q,N19q,N16q,N23q1,N23q2;
wire N10,N11,N16,N19;
wire N22,N23;
nand NAND2_1 (N10, N1q, N3q);
nand NAND2_2 (N11, N3q, N6q);
nand NAND2_3 (N16, N2q, N11q);
nand NAND2_4 (N19, N11q, N7q);
nand NAND2_5 (N22, N10q, N16q);
nand NAND2_6 (N23, N16q, N19q);
always @ (posedge clk) begin
    N1q <= N1;
    N3q <= N3;
    N6q <= N6;
    N2q <= N2;
    N7q <= N7;
    N22q <= N22;
    N23q1 <= N23;
    N23q2 <= N23q1;
    N10q <= N10;
    N11q <= N11;
    N19q <= N19;
    N16q <= N16;
end
endmodule
