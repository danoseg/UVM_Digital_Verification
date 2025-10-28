`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 01:51:20 PM
// Design Name: 
// Module Name: copy_clone
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

class first extends uvm_object;
    rand bit [3:0] data;
    
    function new(string path = "first");
        super.new(path);
    endfunction
    
    `uvm_object_utils_begin(first)
    `uvm_field_int(data,UVM_DEFAULT);    
    `uvm_object_utils_end
    
endclass

module copy_clone();
    first f;
    first s;
    
    // COPY
    /*initial begin
        f = new("first");
        s = new("second");
        f.randomize();
        // Copy method
        s.copy(f);
        f.print();
        s.print();
    end*/
    
    // CLONE
    initial begin
        f = new("first");
        f.randomize();
        // Clone method
        $cast(s, f.clone);
        //s = f.clone();
        f.print();
        s.print();
    end
    
    
endmodule
