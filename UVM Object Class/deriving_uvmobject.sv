`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 10:34:05 AM
// Design Name: 
// Module Name: deriving_uvmobject
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

// Typical skeleton for class
class obj extends uvm_object;
// 1) Rggistering class to macro
    `uvm_object_utils(obj)
// 2) Declaring argument (path) for standard constructor in uvm_object parent class
// - path name should match name of class  
    function new(string path = "obj");
        super.new(path);
    endfunction 
// 3) Data    
    rand bit [3:0] a;
    
        
endclass

module deriving_uvmobject;
    
    obj o;
    
    initial begin
        o = new("obj");
        o.randomize();
        // $sformatf stores a string that can be used as an argument
        `uvm_info("tb_top", $sformatf("Value of a: %0d", o.a), UVM_NONE);
    end
    
endmodule
