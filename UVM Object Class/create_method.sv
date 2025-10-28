`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 02:53:00 PM
// Design Name: 
// Module Name: compare_method
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

class first_mod extends first;

    rand bit ack;
    
    function new(string path = "first_mod");
        super.new(path);
    endfunction
    
    `uvm_object_utils_begin(first_mod)
    `uvm_field_int(ack, UVM_DEFAULT);
    `uvm_object_utils_end
    
endclass 

// Factory Override Method
class comp extends uvm_component;
    `uvm_component_utils(comp)
    
    first f;
    
    function new(string path = "second", uvm_component parent = null);
        super.new(path,parent);
        //f = new(); // This wont add ack in thne print
        f = first::type_id::create("f");
        f.randomize();
        f.print();        
       endfunction     
endclass 

module create_method();
    first f1, f2;
    comp c;
    
    // Factory override
    initial begin
        // This will replace first with first_mod
        c.set_type_override_by_type(first::get_type, first_mod::get_type);
       // c = new("c", null); // This wont add ack in thne print
        c = comp::type_id::create("c", null);
    end
    
    // Create new method
    /*initial begin
        // Create method used for creating objects
        f1 = first::type_id::create("f1");
        f2 = first::type_id::create("f2");    
        f1.randomize();
        f2.randomize();
        f1.print;
        f2.print;
    end*/

endmodule
