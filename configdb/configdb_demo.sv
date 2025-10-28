`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 10:52:32 AM
// Design Name: 
// Module Name: congifdb_demo
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

///////////////////////////////////////////////////////////////////////////////
class comp1 extends uvm_component;
    `uvm_component_utils(comp1)
    
    int data1 = 0;
    
    function new(input string path = "COMP1", uvm_component parent = null);
        super.new(path, parent);
    endfunction 
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // get method will access value stored with set method, and store iin data1
        // container
        // if access is succesful, uvm_config_db returns true
        if(!uvm_config_db#(int)::get(null,"uvm_test_top", "data", data1))
        // this will call uvm_test_top.env.agent.comp1.data
        //if(!uvm_config_db#(int)::get(this,"", "data", data1))
            `uvm_error("COMP1", "Unable to access Interface");
    endfunction 
    
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("COMP1",$sformatf("Data rcvd COMP1 : %0d", data1), UVM_NONE);
        phase.drop_objection(this);
    endtask
endclass 

///////////////////////////////////////////////////////////////////////////////
class comp2 extends uvm_component;
    `uvm_component_utils(comp2)
    
    int data2 = 0;
    
    function new(input string path = "COMP2", uvm_component parent = null);
        super.new(path, parent);
    endfunction 
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(int)::get(null,"uvm_test_top", "data", data2))
            `uvm_error("COMP2", "Unable to access Interface");
    endfunction 
    
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("COMP2",$sformatf("Data rcvd COMP2 : %0d", data2), UVM_NONE);
        phase.drop_objection(this);
    endtask
endclass 

///////////////////////////////////////////////////////////////////////////////
class agent extends uvm_agent;
    `uvm_component_utils(agent)
    
    function new(input string inst = "AGENT", uvm_component c);
    super.new(inst,c);
    endfunction
    
    comp1 c1;
    comp2 c2;
    
    virtual function void build_phase(uvm_phase phase);
        c1 = comp1::type_id::create("COMP1", this);
        c2 = comp2::type_id::create("COMP2", this);
    endfunction
endclass

///////////////////////////////////////////////////////////////////////////////
class env extends uvm_env;
    `uvm_component_utils(env)
    
        function new(input string inst = "ENV", uvm_component c);
            super.new(inst,c);
        endfunction
        
    agent a;
    
        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            a = agent::type_id::create("a", this);
        endfunction 
endclass

///////////////////////////////////////////////////////////////////////////////
class test extends uvm_test;
    `uvm_component_utils(test)
    
    function new(input string inst = "TEST", uvm_component c);
    super.new(inst,c);
    endfunction
    
    env e;
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        e = env::type_id::create("ENV", this);
    endfunction 
endclass

///////////////////////////////////////////////////////////////////////////////
module congifdb_demo();
    
    int data = 256;
    
    initial begin
        // null is used for static components only - tb is static
        // set method will concat argument.uvm_test_top."data" ->  get method
        // with the same keys will have acces to the data value
        uvm_config_db #(int)::set(null, "uvm_test_top", "data",data);
            // this will match concat of "this" get method
         //uvm_config_db #(int)::set(null, "uvm_test_top.env.agent.comp1", "data",data);
         // This sill include all components included in agent class
         //uvm_config_db #(int)::set(null, "uvm_test_top.env.agent*", "data",data);
        run_test("test");
     end
        
     initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
     end 

endmodule
