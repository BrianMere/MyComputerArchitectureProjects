import cam_types::*;

module testbench(cam_itf itf);

cam dut (
    .clk_i     ( itf.clk     ),
    .reset_n_i ( itf.reset_n ),
    .rw_n_i    ( itf.rw_n    ),
    .valid_i   ( itf.valid_i ),
    .key_i     ( itf.key     ),
    .val_i     ( itf.val_i   ),
    .val_o     ( itf.val_o   ),
    .valid_o   ( itf.valid_o )
);

default clocking tb_clk @(negedge itf.clk); endclocking

task reset();
    itf.reset_n <= 1'b0;
    repeat (5) @(tb_clk);
    itf.reset_n <= 1'b1;
    repeat (5) @(tb_clk);
endtask

// DO NOT MODIFY CODE ABOVE THIS LINE

val_t temp;

/*
    Write val to CAM with key.
*/
task write(input key_t key, input val_t val);
<<<<<<< HEAD
    $display("Writing %d to key $d", val, key);
=======
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    itf.valid_i <= 1; // assert rw
    itf.key <= key;
    itf.val_i <= val; // when writing we write val to input val. 
    itf.rw_n <= 0; // writes on 1'b0.
    @(tb_clk);
    itf.valid_i <= 0;
endtask : write

/*
    Read val from CAM using key. Assert if the val is incorrect. 
*/
<<<<<<< HEAD
task read(input key_t key, input val_t val);
    $display(itf.valid_o);
    $display(itf.val_o);
    $display(val);
=======
task read(input key_t key, output val_t val);
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    itf.valid_i <= 1; // assert rw
    itf.key <= key;
    itf.rw_n <= 1; // reads on 1'b1.
    @(tb_clk);
    itf.valid_i <= 0;
<<<<<<< HEAD
    $display(itf.valid_o);
    $display(itf.val_o);
    $display(val);
    assert (itf.valid_o && itf.val_o == val) 
=======
    assert (itf.valid_o == val) 
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    else  begin
        $error("Tried reading value %d using key %d", val, key);
        itf.tb_report_dut_error(READ_ERROR);
    end
endtask : read

initial begin
    $display("Starting CAM Tests");
<<<<<<< HEAD
=======
    key_t m_key = 0; // can't find key_t for some reason. 
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    reset();
    /************************** Your Code Here ****************************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
    // Consider using the task skeltons above
    
<<<<<<< HEAD
    // Evict key-value pairs from all camsize_p indices
    for(val_t i = 0; i < 8; ++i) begin
        automatic key_t key = i;
        write(key, i);
    end
    for(val_t i = 8; i < 16; ++i) begin
=======
    // Evict key-value pairs from all camsize_p indices and read hit for each index
    for(val_t i = 0; i < (1 << (val_width_p - 1)); ++i) begin
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        automatic key_t key = i;
        write(key, i);
    end

<<<<<<< HEAD
    // Now read-hit all those indices
    for(val_t i = 8; i < 16; ++i) begin
        automatic key_t key = i;
        read(key, i);
    end

    // Now perform writes of different values to the same key (write-write)
    
    for(val_t i = 0; i < 1 << (val_width_p - 1); ++i) begin
        key_t m_key;
        m_key = 420;
        write(m_key, i);
        write(m_key, i);
    end

    // Now write/read from consecutive cycles to/from same key (write-read)
    for(val_t i = 0; i < 1 << (val_width_p - 1); ++i) begin
        key_t m_key;
        m_key = 69;
=======
    // Now perform writes of different values to the same key
    
    for(val_t i = 0; i < 1 << (val_width_p - 1); ++i) begin
        write(m_key, i);
    end

    // Now write/read from consecutive cycles to/from same key. 
    for(val_t i = 0; i < 1 << (val_width_p - 1); ++i) begin
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        write(m_key, i);
        read(m_key, i);
    end

<<<<<<< HEAD
=======

>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    /**********************************************************************/

    itf.finish();
end

endmodule : testbench
