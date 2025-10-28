`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 04:25:55 PM
// Design Name: 
// Module Name: phases_classification
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

// Phases
// Do not consume time : Function : need to add -super. (construction_phase, cleanuo_phase)
// Consume time : Task (run_phase)

// Construction phase: 
//      build_phase -> create object of a class
//      connect_phase -> perform connection of component in TLM
//      end_of_elaboration_phase -> adjust hierarchy
//      start_of+simulation_phase -> configure environment before applying stimuls
//
// run phase: applying stimulus to DUT and receiving response
//      reset_phase (pre_reset_phase, post_reset_phase) -> system reset
//      configure_phase ->  mem/array/variable that needs to be initialized before generation of stimuli
//      main_phase -> generating stimuli + collecting response
//      shutdown_phase -> ensures all stimu;li is correctly applied to DUT and response is received
//
// Cleanup Phase -> clean and report data, check wether coverage goals are achieved
//      extract
//      check
//      report
//      final




module phases_classification(

    );
endmodule
