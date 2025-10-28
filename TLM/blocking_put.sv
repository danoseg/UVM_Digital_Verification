`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 06:44:09 PM
// Design Name: 
// Module Name: blocking_put
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



// uvm_blocking_put_port #(parameter)
// uvm_blocking_put_export #(parameter) -> puts data in export
// uvm_blocking_put_imp #(parameter) -> implementation
// #parameter is the transaction bieng transferred

`include "uvm_macros.svh"
import uvm_pkg::*;

class producer extends uvm_component;
  `uvm_component_utils(producer)
  
  int data = 12;
  
  uvm_blocking_put_port #(int) send;
  
  function new(input string path = "producer", uvm_component parent = null);
    super.new(path, parent);    
    send  = new("send", this);    
  endfunction  
  
  task main_phase(uvm_phase phase);   
    phase.raise_objection(this);
    send.put(data);
    `uvm_info("PROD" , $sformatf("Data Sent : %0d", data), UVM_NONE);
    phase.drop_objection(this);    
  endtask
  
 
    
endclass
////////////////////////////////////////////////
 
class consumer extends uvm_component;
  `uvm_component_utils(consumer)
  
  
  uvm_blocking_put_export #(int) recv;
  uvm_blocking_put_imp #(int, consumer) imp;
  
  function new(input string path = "consumer", uvm_component parent = null);
    super.new(path, parent);
    
    recv  = new("recv", this);
    imp   = new("imp" , this);
    
  endfunction
  
  task put(int datar);
    `uvm_info("CONS" , $sformatf("Data Rcvd : %0d", datar), UVM_NONE);
  endtask
  
  
endclass
 
//////////////////////////////////////////////////////////////////////////////////
 
class env extends uvm_env;
`uvm_component_utils(env)
 
producer p;
consumer c;
 
 
  function new(input string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
 
 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  p = producer::type_id::create("p",this);
  c = consumer::type_id::create("c", this);
 endfunction
 
  
  
 virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
  
  p.send.connect(c.recv);
  c.recv.connect(c.imp); 
  
 endfunction
 
 
endclass
 
///////////////////////////////////////////////////
 
class test extends uvm_test;
`uvm_component_utils(test)
 
  env e;
 
  function new(input string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
 
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  e = env::type_id::create("e",this);
  endfunction
 
 
endclass
 
//////////////////////////////////////////////
module blocking_put;
 
 
initial begin
  run_test("test");
end
 
 
endmodule

 
 
 