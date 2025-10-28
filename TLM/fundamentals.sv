`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 06:33:14 PM
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

// UVM uses TLM to send transactions instead of mailbox and semaphore
// TLM: Transaction Level Modeling
// Port : Initiator -> component that initiates transaction, represented as a square in block diagram
// Export : Responder -> component that responds to request of port, represented as a circle in block diagram
//
// Control flow , Data flow
// If data flow is same direction in which request is sent, use put operation
// if data flow is opposite direction in which request is sent, use get operation
// if data flow is in both directions, use transport operation

// operations can be used in blocking and non-blocking manner
// put + blocking
// get + blocking
// transport + blocking


module fundamentals(

    );
endmodule
