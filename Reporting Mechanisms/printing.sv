`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 03:28:35 PM
// Design Name: 
// Module Name: printing
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

`include "uvm_macros.svh"
import uvm_pkg::*;

module printing();
    int data = 56;
    
    initial begin
    `uvm_info("printing_top", $sformatf("Vale of variable data: %0d",data), UVM_NONE);
    end
endmodule
