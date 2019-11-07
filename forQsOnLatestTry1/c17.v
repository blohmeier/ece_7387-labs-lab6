`timescale 1ns / 1ps

//For design 1 of 4 (No pipelining) and design 2 of 4 (single stage pipeline at IPs/OPs).
module c17 (N1,N2,N3,N6,N7,clk,sync,r,d,s,N22,N23);
input N1,N2,N3,N6,N7,clk,sync,r,d,s;
output N22,N23;
wire N10,N11,N16,N19,Q1out,Q2out,Q3out,Q6out,Q7out,N22out,N23out,Q22,Q23;
reg Q1,Q2,Q3,Q6,Q7,N22,N23;
nand NAND2_1 (N10, Q1out, Q3out);
nand NAND2_2 (N11, Q3out, Q6out);
nand NAND2_3 (N16, Q2out, N11);
nand NAND2_4 (N19, N11, Q7out);
nand NAND2_5 (N22out, N10, N16);
nand NAND2_6 (N23out, N16, N19);
//For design 2:
// Instantiate module Dff_ and connect each signal (in CAPS) to each Dff_ port (starting with ".") by name:
// for inputs:
Dff_ ipFromN1 (.d(N1),.q(Q1out));
Dff_ ipFromN3 (.d(N3),.q(Q3out));
Dff_ ipFromN2 (.d(N2),.q(Q2out));
Dff_ ipFromN6 (.d(N6),.q(Q6out));
Dff_ ipFromN7 (.d(N7),.q(Q7out));
always @(posedge clk or posedge r or posedge s or posedge sync) begin
    assign Q1 = Q1out;
    assign Q2 = Q2out;
    assign Q3 = Q3out;
    assign Q6 = Q6out;
    assign Q7 = Q7out;
end
// for outputs:
Dff_ opFromN22 (.d(N22out),.q(Q22));
Dff_ opFromN23 (.d(N23out),.q(Q23));
always @(posedge clk or posedge r or posedge s or posedge sync) begin
    assign N22 = Q22;
    assign N23 = Q23;
end
// for outputs:

/*
module c17(N1,N2,N3,N6,N7,N22q,N23q);
input N1,N2,N3,N6,N7;
output N22q,N23q;
wire N10,N11,N16,N19;
nand NAND2_1 (N10, N1q, N3q);
nand NAND2_2 (N11, N3q, N6q);
nand NAND2_3 (N16, N2q, N11);
nand NAND2_4 (N19, N11, N7q);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);
always @ (posedge clk) begin
    N1q <= N1;
    N3q <= N3;
    N6q <= N6;
    N2q <= N2;
    N7q <= N7;
    N22q <= N22;
    N23q <= N23;
end
*/
//Design 3 of 4 - Two pipeline stages (additionally at wires N10, N11 and N19)
/*
module c17(N1,N2,N3,N6,N7,N22q,N23q,clk);
input N1,N2,N3,N6,N7,clk;
output N22q,N23q;
wire N10,N11,N16,N19;
wire N22,N23;
reg N1q,N3q,N6q,N2q,N7q,N22q,N23q,N10q,N11q,N19q;
nand NAND2_1 (N10, N1q, N3q);
nand NAND2_2 (N11, N3q, N6q);
nand NAND2_3 (N16, N2q, N11q);
nand NAND2_4 (N19, N11q, N7q);
nand NAND2_5 (N22, N10q, N16);
nand NAND2_6 (N23, N16, N19q);
always @ (posedge clk) begin
    N1q <= N1;
    N3q <= N3;
    N6q <= N6;
    N2q <= N2;
    N7q <= N7;
    N22q <= N22;
    N23q <= N23;
    N10q <= N10;
    N11q <= N11;
    N19q <= N19;
end
*/

//Design 4 of 4 - Three pipeline stages (additionally at wires N16, N19, and a second at output N23)
/*
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
*/
endmodule
