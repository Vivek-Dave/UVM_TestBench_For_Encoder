
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "encoder_sequence_item.sv"        // transaction class
 `include "encoder_sequence.sv"             // sequence class
 `include "encoder_sequencer.sv"            // sequencer class
 `include "encoder_driver.sv"               // driver class
 `include "encoder_monitor.sv"
 `include "encoder_agent.sv"                // agent class  
 `include "encoder_coverage.sv"             // coverage class
 `include "encoder_scoreboard.sv"           // scoreboard class
 `include "encoder_env.sv"                  // environment class

 `include "encoder_test.sv"                 // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


