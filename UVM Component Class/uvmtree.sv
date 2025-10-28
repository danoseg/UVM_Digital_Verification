`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 08:53:51 AM
// Design Name: 
// Module Name: uvmtree
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

///////////////////////////////////////////////////////////////////////
class a extends uvm_component;
    `uvm_component_utils(a)
    
    function new(string path = "a", uvm_component parent = null);
        super.new(path, parent);
    endfunction
    
     virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("a", "Class a executed", UVM_NONE);
     endfunction 
    
endclass

////////////////////////////////////////////////////////////////////////
class b extends uvm_component;
    `uvm_component_utils(b)
    
    function new(string path = "b", uvm_component parent = null);
        super.new(path, parent);
    endfunction
    
     virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("b", "Class b executed", UVM_NONE);
     endfunction 
    
endclass

////////////////////////////////////////////////////////////////////////
/// Parent class of a and b
class c extends uvm_component;
    `uvm_component_utils(c)
    
    a a_inst;
    b b_inst;
    
    function new(string path = "c", uvm_component parent = null);
        super.new(path, parent);
    endfunction
    
     virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        a_inst = a::type_id::create("a_inst", this);
        b_inst = b::type_id::create("b_inst", this);
     endfunction 
     
     virtual function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
            uvm_top.print_topology();
     endfunction
    
endclass

/////////////////////////////////////////////////////////////////////////
module uvmtree();
    
    initial begin
        run_test("c");
    end
    
    //Manual implementation (NOt recommended)    
    /*c c_inst;    
    initial begin
        c_inst = c::type_id::create("c_inst", null);
        c_inst.buildphase(null);
    end*/

endmodule
