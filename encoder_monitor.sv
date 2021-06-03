
class encoder_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(encoder_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="encoder_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  encoder_sequence_item  txn;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(encoder_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    ap_mon=new("ap_mon",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    encoder_sequence_item txn=encoder_sequence_item::type_id::create("txn",this);
    forever
    begin
      sample_dut(txn); 
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task sample_dut(output encoder_sequence_item txn);
    encoder_sequence_item t = encoder_sequence_item::type_id::create("t");
    @(vif.in);
    t.in  = vif.in;
    t.out = vif.out;
    txn = t;
  endtask
  //----------------------------------------------------------------------------

endclass:encoder_monitor

