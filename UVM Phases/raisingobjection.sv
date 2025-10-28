`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 05:19:29 PM
// Design Name: 
// Module Name: raisingobjection
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

// Debugging methods for phase
// cmd line switch: +UVM_PHASE_TRACE

// Debugging for objection
// cmd line switch: +UVM_OBJECTION_TRACE

`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class comp extends uvm_component;
  `uvm_component_utils(comp)
  
 
  function new(string path = "comp", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  task reset_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("comp","Reset Started", UVM_NONE);
     #10;
    `uvm_info("comp","Reset Completed", UVM_NONE);
    phase.drop_objection(this);
  endtask
  
  
endclass
 
///////////////////////////////////////////////////////////////////////////
module raisingobjection;
  
  initial begin
    run_test("comp");
  end
  
 
endmodule