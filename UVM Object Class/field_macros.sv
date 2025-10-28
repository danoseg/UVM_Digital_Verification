`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 10:34:05 AM
// Design Name: 
// Module Name: deriving_uvmobject
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

// Typical skeleton for object class
// Int class
class obj extends uvm_object;

    function new(string path = "obj");
        super.new(path);
    endfunction 
    
  rand bit [3:0] a,b;
    
    // Integer field macro for "a"
    //Utility macros begin
    `uvm_object_utils_begin(obj)
    // Add Field macro `uvm_field_int(variable name, FLAG | Radix)
    `uvm_field_int(a, UVM_DEFAULT | UVM_BIN);   
  	`uvm_field_int(b, UVM_NOPRINT);   
    `uvm_object_utils_end        
endclass

// ENUM, REAL, STRING CLASS
class obj2 extends uvm_object;
    
    typedef enum bit [1:0]{s0, s1, s2, s3} state_type;
    rand state_type state;
    
    real temp = 12.34;
    string str = "UVM";

    function new(string path = "obj2");
        super.new(path);
    endfunction 
    
    `uvm_object_utils_begin(obj2)
    `uvm_field_enum(state_type, state, UVM_DEFAULT);
    `uvm_field_string(str, UVM_DEFAULT);
    `uvm_field_real(temp, UVM_DEFAULT);
    `uvm_object_utils_end
    
endclass

// OBJECT CLASS
class parent extends uvm_object;
    
     function new(string path = "parent");
        super.new(path);
    endfunction 
    
    rand bit [3:0] data;
    `uvm_object_utils_begin(parent)
    `uvm_field_int(data, UVM_DEFAULT);   
    `uvm_object_utils_end  

endclass

class child extends uvm_object;
    parent p;
    
    function new(string path = "child");
        super.new(path);
        p = new("parent");  // build_phase + create
    endfunction 
    
    `uvm_object_utils_begin(child)
    `uvm_field_object(p, UVM_DEFAULT);
    `uvm_object_utils_end
    
endclass

// ARRAYS
class array extends uvm_object;
    
    //Static Array
    int arr1[3] = {1,2,3};
    // Dynamic array
    int arr2[];
    // Queue - pop_front, pop_back
    int arr3[$];
    // Associative array
    int arr4[int];
    
    
    function new(string path = "array");
        super.new(path);
    endfunction 
    
    `uvm_object_utils_begin(array)
    `uvm_field_sarray_int(arr1, UVM_DEFAULT);
    `uvm_field_array_int(arr2, UVM_DEFAULT);
    `uvm_field_queue_int(arr3, UVM_DEFAULT);
    `uvm_field_aa_int_int(arr4, UVM_DEFAULT);
    `uvm_object_utils_end
    
     task run();
        // Dynamic array
        arr2 = new[3];
        arr2[0] = 2;
        arr2[1] = 2;
        arr2[2] = 2;
        
        // Queue  
        arr3.push_front(3);
        arr3.push_front(3);
        
        // Assosiative array
        arr4[1] = 4;
        arr4[2] = 4;
        arr4[3] = 4;
        arr4[4] = 4;
     endtask
endclass

module field_macros;
    
    array a;;
    
    initial begin
        a = new("array");       
       // Automation
    //  for( int i = 0; i< 5; i++) begin
       // o.randomize();       
       a.run();
       // Line, Tree, Table
       // Default print is table format
       a.print(uvm_default_table_printer);
     // end
    end
    
endmodule
