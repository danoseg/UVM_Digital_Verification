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


`include "uvm_macros.svh"
import uvm_pkg::*;
 
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
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module log_file;
  driver d;
  int file;
  //string log_file;
  
  initial begin
    // Specify the file
   file = $fopen("log.txt", "w");
   //log_file = "F:/M.Eng/Udemy - UVM Course/reporting_mechanism/log.txt";
    d = new("DRV", null);
    d.set_report_default_file(file);
    
    // Use this macro to specify which kind of reports to store in file
   // d.set_report_severity_file(UVM_ERROR, file);
    
    // Define actions for macros - Include store to file action
    d.set_report_severity_action(UVM_INFO, UVM_DISPLAY|UVM_LOG);
    d.set_report_severity_action(UVM_WARNING, UVM_DISPLAY|UVM_LOG);
    d.set_report_severity_action(UVM_ERROR, UVM_DISPLAY|UVM_LOG);
 
    d.run();    
    #10;
    $fclose(file);
  end
  
  
  
endmodule