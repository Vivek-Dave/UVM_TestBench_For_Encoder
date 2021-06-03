
/***************************************************
** class name  : encoder_sequence
** description : generate input continiously 
***************************************************/
class encoder_sequence extends uvm_sequence#(encoder_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(encoder_sequence)            
  //----------------------------------------------------------------------------

  encoder_sequence_item txn;
  int unsigned REPEAT=1;
  bit [7:0] shift=1;
  //----------------------------------------------------------------------------
  function new(string name="encoder_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(REPEAT) begin
      for(int i=0;i<8;i++) begin  
        txn=encoder_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.in == shift;};
        #5;
        finish_item(txn);
        shift=shift<<1;
      end
    end
    shift=1;
  endtask:body
  //----------------------------------------------------------------------------
endclass:encoder_sequence

/***************************************************
** class name  : encoder_random_sequence
** description : generate random sequence
***************************************************/
class encoder_random_sequence extends encoder_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(encoder_random_sequence)      
  //----------------------------------------------------------------------------
  
  encoder_sequence_item txn;
  int unsigned REPEAT=20;
  
  //----------------------------------------------------------------------------
  function new(string name="encoder_random_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin 
      txn=encoder_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize();
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass
