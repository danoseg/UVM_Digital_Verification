`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 01:51:20 PM
// Design Name: 
// Module Name: copy_clone
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

class first extends uvm_object;
    rand bit [3:0] data;
    
    function new(string path = "first");
        super.new(path);
    endfunction
    
    `uvm_object_utils_begin(first)
    `uvm_field_int(data,UVM_DEFAULT);    
    `uvm_object_utils_end
    
endclass

class second extends uvm_object;
    first f;
    
    
    function new(string path = "second");
        super.new(path);
        f = new("first");
    endfunction
    
    `uvm_object_utils_begin(second)
    `uvm_field_object(f,UVM_DEFAULT);    
    `uvm_object_utils_end
    
endclass

module shallow_deep_copy();
    
    second s1,s2,s3; 
    
    initial begin
        s1 = new("s1");
        s2 = new("s2");
       
       // CLONE -> DEEP COPY
       s1.f.randomize();
       $cast(s3,s1.clone());
       s1.print();
       s3.print();
       s3.f.data = 12;
       s1.print();
       s3.print();
       
       // DEEP COPY  -> S2.COPY(S1)
    /*    s1.f.randomize();
      
        s2.copy(s1); // Deep Copy
        s1.print();
        s2.print();
        
        s2.f.data = 14;
        s1.print();
        s2.print();*/
        
       // SHALLOW COPY  S2 = S1
 /*       s1.f.randomize();
        s1.print();
        s2 = s1; // Shallow Copy
        s2.print();
        s2.f.data = 12;
        // Data is changed for both s1 and s2 since this is shallow copy
      s1.print();
      s2.print();*/
    end
endmodule
