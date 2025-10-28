`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 03:57:08 PM
// Design Name: 
// Module Name: verbosity_level
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

typedef enum{
    UVM_NONE = 0,
    UVM_LOW = 100,
    UVM_MEDIUM = 200,
    UVM_HIGH = 300,
    UVM_FULL = 400,
    UVM_DEBUG = 500
} uvm_verbosity;

module verbosity_level();
    
    initial begin
      $display("Default verbosity level: %0d", uvm_top.get_report_verbosity_level);
      #10;
      // Adjust the Default Verbosity Level
      uvm_top.set_report_verbosity_level(UVM_HIGH);
      `uvm_info("verbosity_level_top", "String", UVM_HIGH);
    end

endmodule
