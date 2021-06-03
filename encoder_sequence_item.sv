class encoder_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  rand logic [7:0] in;  //i/p

  logic [2:0] out;      //o/p
  
  //---------------- register encoder_sequence_item class with factory --------
  `uvm_object_utils_begin(encoder_sequence_item) 
     `uvm_field_int( in  ,UVM_ALL_ON)
     `uvm_field_int( out ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="encoder_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf("in=%8b ",in));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf("out=%3b",out));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:encoder_sequence_item
