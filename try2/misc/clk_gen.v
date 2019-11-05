`timescale 1ns / 1ps

module clk_gen(clk1);
output clk1;

parameter clkPd = 0.1;
reg clk_reg

initial begin
    clk = 0;
    end
always
    begin
    if (clk)
        assign clk_reg <= (clkPd*0.20) clk;
    else
        assign clk_reg <= (clkPd*0.80) clk;
    end
endmodule
