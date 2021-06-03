class encoder_sequencer extends uvm_sequencer#(encoder_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(encoder_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="encoder_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:encoder_sequencer

