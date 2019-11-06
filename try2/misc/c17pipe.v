`timescale 1ns / 1ps

module c17pipe(N1,N2,N3,N6,N7,N22,N23,clk,din,r,s,dout);

input N1,N2,N3,N6,N7,clk,din,r,s;
output N22,N23,dout;
    
wire N10,N11,N16,N19;
reg NAND2_1q;
    
c17 U1 (N1,N2,N3,N6,N7,N22,N23);

always @ (posedge clk) 
    begin
    u2q <= N10; //dff on N10 wire
    end

assign N22 = 

endmodule
