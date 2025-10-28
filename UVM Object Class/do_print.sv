`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 04:42:09 PM
// Design Name: 
// Module Name: do_print
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

class obj extends uvm_object;
    `uvm_object_utils(obj)
    
    function new(string path = "obj");
        super.new(path);
    endfunction 
    
    bit [3:0] a = 4;
    string b = "UVM";
    real c = 12.34;
    
    // DO_PRINT TEMPLATE
    virtual function void do_print(uvm_printer printer);
        super.do_print(printer);
        // $bits returns the size 
        printer.print_field_int("a", a, $bits(a), UVM_HEX);
        printer.print_string("b", b);
        printer.print_real("c", c);
    endfunction 
    
endclass

module do_print();
    obj o;
    
    initial begin
        o = obj::type_id::create("o");
        o.print();
    end
endmodule
