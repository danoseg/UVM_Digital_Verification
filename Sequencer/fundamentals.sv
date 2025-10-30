`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 08:17:44 PM
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

// E.G. Verification of a memory
// multiple test cases
// Sequence : a class that contains one possible test case
//e.g.
// Seq 1 - Verifying write port
// Seq 2 - Verifying read port
// Seq 3 - Verifying addr prot

// Transaction -> Sequence -> Sequencer -> Driver -> Interface -> DUT -> ack to sequencer 
// Sequencer : seq_item_export
// Driver : seq_item_port

// TB Hierarchy:
// Agent: Sequencer -> Driver
// Env: Monitor -> Scoreboard
// Test: Decide seq to be send to sequence
// Monitor : Receive response from DUT
// Scoreboard : Compare with golden data


module fundamentals(

    );
endmodule
