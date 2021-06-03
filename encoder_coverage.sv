
class encoder_coverage extends uvm_subscriber #(encoder_sequence_item);

  //----------------------------------------------------------------------------
  `uvm_component_utils(encoder_coverage)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="",uvm_component parent);
    super.new(name,parent);
    dut_cov=new();
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  encoder_sequence_item txn;
  real cov;
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  covergroup dut_cov;
    option.per_instance= 1;
    option.comment     = "dut_cov";
    option.name        = "dut_cov";
    option.auto_bin_max= 126;
    IN:coverpoint txn.in { 
        bins name1_1={8'b0000_0001};
        bins name2_1={8'b0000_0010};
        bins name3_1={8'b0000_0100};
        bins name4_1={8'b0000_1000};
        bins name5_1={8'b0001_0000};
        bins name6_1={8'b0010_0000};
        bins name7_1={8'b0100_0000};
        bins name8_1={8'b1000_0000};
    }
  endgroup:dut_cov;

  //----------------------------------------------------------------------------

  //---------------------  write method ----------------------------------------
  function void write(encoder_sequence_item t);
    txn=t;
    dut_cov.sample();
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    cov=dut_cov.get_coverage();
  endfunction
  //----------------------------------------------------------------------------


  //----------------------------------------------------------------------------
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),$sformatf("Coverage is %f",cov),UVM_MEDIUM)
  endfunction
  //----------------------------------------------------------------------------
  
endclass:encoder_coverage

