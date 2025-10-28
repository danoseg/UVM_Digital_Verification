`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 10:30:50 AM
// Design Name: 
// Module Name: configdb
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
 
class env extends uvm_env;
  `uvm_component_utils(env)
  
  int data;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
    
    if(uvm_config_db#(int):: get(null, "uvm_test_top", "data", data))
      `uvm_info("ENV", $sformatf("Value of data : %0d", data), UVM_NONE)
     else
       `uvm_error("ENV", "Unable to access the Value");
     
    
  endfunction
  
  
  
endclass
///////////////////////////////////////////////////
  
 class test extends uvm_test;
   `uvm_component_utils(test)
  
   env e;
  
   function new(string path = "test", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     e = env::type_id::create("e",this);
     //////////////////////////////
     // Using config_db for env.data
     uvm_config_db#(int)::set(null,"uvm_test_top", "data", 12); ////context + instance name + key + value
     
   endfunction
  
endclass 
 
///////////////////////////
 
module configdb;
  
  initial begin
    run_test("test");
    
  end
  
  
endmodule
 