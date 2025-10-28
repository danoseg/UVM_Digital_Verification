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
    
    rand bit [3:0] a;
    rand bit [4:0] b;
    
    virtual function void do_print(uvm_printer printer);
        super.do_print(printer);
        // $bits returns the size 
        printer.print_field_int("a", a, $bits(a), UVM_HEX);
        printer.print_field_int("b", b, $bits(b), UVM_HEX);
    endfunction 
    
    // DO_COPY TEMPLATE
    virtual function void do_copy(uvm_object rhs);
        obj temp;
        // $cast makes temp and rhs objects of same type, temp has access to data of rhs
        $cast(temp, rhs);
        super.do_copy(rhs);
            this.a = temp.a;
            this.b = temp.b;
    endfunction     
endclass

module do_copy();
    obj o1, o2;
    
    initial begin
        o1 = obj::type_id::create("o1");
        o2 = obj::type_id::create("o2");
        
        o1.randomize();
        o1.print();
        o2.copy(o1);
        o2.print();
    end
endmodule
