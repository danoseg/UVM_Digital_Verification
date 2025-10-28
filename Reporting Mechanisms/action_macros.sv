`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 05:23:47 PM
// Design Name: 
// Module Name: action_macros
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

// UVM_NO_aCTION - no action is taken
// UVM_DISPLAY   - Sends the report to the standard output
// UVM_LOG       - Sends the report to the file(s) for this (severity, ID) pair
// UVM_COUNT     - Counts the number of reports with the COUNT attribute
//                 When this value reaches max_quit_count, simulation terminates 
// UVM_EXIT      - Terminates the simulation immediately
// UVM_CALL_HOOK - Callback the report hook methods
// UVM_STOP      - Causes ~$stop~ to be executed, putting the simulation into
//                 interactive mode
// UVM_RM_RECORD - Sends the report to the recorder 

// Mandatory code
`include "uvm_macros.svh" // Contains definitions of all uvm macros - allows use of all macros, including reporting macros
import uvm_pkg::*;  // Containts definitions of all uvm classes - Allows us to get access to definition of classes that we will extend to build testbench

 
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
    task run();
        `uvm_info("DRV", "Informational Message", UVM_NONE);
        `uvm_warning("DRV", "Potential Error");
        `uvm_error("DRV", "Real Error");
        `uvm_error("DRV", "Second Real Error");
        #10;
        `uvm_fatal("DRV", "Simulation cannot continue");
        #10
       `uvm_fatal("DRV1", "simulation cannot continue");
        $display("Simulation Ended");
    endtask 
endclass

module action_macros;
    
    driver d;
    
    initial begin
    #50;
        d = new("DRV", null);
      // CHANGE ACTION OF THE UVM_INFO MACRO
        d.set_report_severity_action(UVM_FATAL, UVM_DISPLAY);
        // SET THRESHOLD FOR MAX # OF ERRORS
        d.set_report_max_quit_count(2);
        d.run();
    end    
endmodule
