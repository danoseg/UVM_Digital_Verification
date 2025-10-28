`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 02:15:19 PM
// Design Name: 
// Module Name: reporting_macros
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


// `UVM_INFO - Informative message
// `UVM_WARNING - Indicates a Potential Problem
// `UVM_ERROR - Indicates real problem. Simulation Continues to the configured message action
// `UVM_FATAL - Indicates a problem from which simulation cannot recover. Simulation exits via $finish after a #0 delay.

// UVM_INFO(ID, Msg, Redundancy level)
//      ID : Class sending data to console
//      Msg : Message
//      Redundancy level of macro : default = 200 (uvm_medium)
//          if redundance level =< default redundancy level. Otherwise string will not be sent to console
//          lower redundancy level

// UVM_WARNING(ID, MSG);
// UVM_ERROR(ID, MSG);
// UVM_FATAL(ID, MSG);

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
        #10;
        `uvm_fatal("DRV", "Simulation cannot continue");
      #10
       `uvm_fatal("DRV1", "simulation cannot continue");
        $display("Simulation Ended");
    endtask 
endclass

module reporting_macros;
    
    driver d;
    
    initial begin
    #50;
        d = new("DRV", null);
      // CHANGE SEVERITY OF REPORTS (all kind of same reports)
        d.set_report_severity_override(UVM_FATAL, UVM_ERROR);
      	// CHANGE SEVERITY OF SPECIFIC IDS
    	d.set_report_severity_id_override(UVM_FATAL, "DRV1", UVM_ERROR);
        d.run();
    end    
endmodule
