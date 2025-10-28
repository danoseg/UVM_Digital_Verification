`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 05:00:26 PM
// Design Name: 
// Module Name: convert2string
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

class obj extends uvm_object;
    `uvm_object_utils(obj)
    
    function new(string path = "obj");
        super.new(path);
    endfunction 
    
    bit [3:0] a = 4;
    string b = "UVM";
    real c = 12.34;
    
    // CONVERT2STRING TEMPLATE
    virtual function string convert2string();
    
        string s = super.convert2string();
      s = {s, $sformatf("a : %0d ", a)};
      s = {s, $sformatf("b : %0s ", b)};
      s = {s, $sformatf("c : %0f ", c)};
        // a : 4 b : UVM c : 12.34
        return s;
    endfunction 
    
endclass

module convert2string;

    obj o;
    
    initial begin
        o = obj::type_id::create("o");
      //$display("%0s", o.convert2string());
      `uvm_info("TB_TOP", $sformatf("%0s", o.convert2string()), UVM_NONE);
    end
endmodule
