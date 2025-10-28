`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 08:25:39 AM
// Design Name: 
// Module Name: uvm_component
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

class comp extends uvm_component;
    `uvm_component_utils(comp)
    
    function new(string path = "comp", uvm_component parent = null);
        super.new(path,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("COMP", "Build phase of comp executed", UVM_NONE);
    endfunction
    
endclass

module uvmcomponent;
    
    comp c;
    
    initial begin
        // null specifies the class as a child to uvm_top
        c = comp::type_id::create("c", null);
        // null should be the name of the phase
        c.build_phase(null);
    end
    
   /* initial begin
        run_test("comp");
    end*/

endmodule
