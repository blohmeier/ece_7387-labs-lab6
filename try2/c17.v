`timescale 1ns / 1ps
// Verilog
// c17
// Ninputs 5
// Noutputs 2
// NtotalGates 6
// NAND2 6
module c17(N1,N2,N3,N6,N7,N22,N23,clk);

input N1,N2,N3,N6,N7,clk;

output N22,N23;

wire N10,N11,N16,N19;
reg NAND2_1q;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, NAND2_1q, N16);
nand NAND2_6 (N23, N16, N19);

always @ (posedge clk) begin
    NAND2_1q <= N10; //dff on N10 wire
end

endmodule
