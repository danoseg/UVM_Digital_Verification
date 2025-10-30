`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 11:13:37 AM
// Design Name: 
// Module Name: adder4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder4(
    input logic [3:0] a,b,
    input logic clk, rst,
    output logic [4:0] y
    );
    
    always@(posedge clk)
    begin
        if(rst)  
            y <= 5'b00000;
        else
        y <= a + b;      
    end    
endmodule

interface add_if;
    logic [3:0] a,b;
    logic [4:0] y;
    logic clk,rst;
endinterface
