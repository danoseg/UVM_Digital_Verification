`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 10:15:32 AM
// Design Name: 
// Module Name: fundamentals
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

// Static components - Driver, Monitor, Scoreboard : uvm_component (ii.e. uvm_driver)
//                   - Can use uvm_tree
//                   - Works in phases
// Dynamic components - Transaction : uvm_objects (i.e. uvm_sequence_item)

// Base Class : uvm_object, uvm_component

// uvm _object:   uvm_transaction, uvm_sequence_item, uvm_sequence
// uvm_component: uvm_driver, uvm_sequencer, uvm_monitor, uvm_agent,
//                uvm_scorebord, uvm_env, uvm_test

// Methods for trannsaction automation:
// Core methods (Field MAcros): Print, Record, Copy, Compare, Create, Clone, Pack + Unpack

// User-Defined do_methods : do_print, do_record, do_Copy, do_Compare, do_pack, do_unpack
//               - Need to specify how prnt, record, etc will happen



module fundamentals();
    
endmodule
