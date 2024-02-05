`ifndef testbench
`define testbench

import fifo_types::*;

module testbench(fifo_itf itf);

fifo_synch_1r1w dut (
    .clk_i     ( itf.clk     ),
    .reset_n_i ( itf.reset_n ),

    // valid-ready enqueue protocol
    .data_i    ( itf.data_i  ),
    .valid_i   ( itf.valid_i ),
    .ready_o   ( itf.rdy     ),

    // valid-yumi deqeueue protocol
    .valid_o   ( itf.valid_o ),
    .data_o    ( itf.data_o  ),
    .yumi_i    ( itf.yumi    )
);

// Clock Synchronizer
default clocking tb_clk @(negedge itf.clk); endclocking

task reset();
    itf.reset_n <= 1'b0;
    ##(10);
    itf.reset_n <= 1'b1;
    ##(1);
endtask : reset

function automatic void report_error(error_e err); 
    itf.tb_report_dut_error(err);
endfunction : report_error

// DO NOT MODIFY CODE ABOVE THIS LINE

/*
    Enquee word_t i into the FIFO. 
*/
task enqueue(word_t i);
	if(itf.rdy) begin
        itf.valid_i <= 1;
        itf.data_i <= i;
        ##(1);
        itf.valid_i <= 0;
    end
endtask : enqueue

/*
    Dequeue from FIFO and check that what's dequeued is word_t i.
*/
task dequeue(word_t i);
    if(itf.valid_o) begin
<<<<<<< HEAD
        $display("data: %d, i: %d", itf.data_o, i);
=======
        itf.yumi <= 1;
        @(tb_clk);
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        assert (itf.data_o == i) 
        else  begin
            $error("Reading data from FIFO failed: Got %d and expected %d.", itf.data_o, i);
            report_error(INCORRECT_DATA_O_ON_YUMI_I);
        end
<<<<<<< HEAD
        itf.yumi <= 1;
        @(tb_clk);
        $display("data: %d, i: %d", itf.data_o, i);
        itf.yumi <= 0;
    end
    else begin
        $error("Tried to read data from an empty queue and assert it.");
        report_error(INCORRECT_DATA_O_ON_YUMI_I);
    end
=======
        itf.yumi <= 0;
    end
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
endtask : dequeue

/*
    Enqueue element i and dequeue to test with j. 
*/
task simultaneously(word_t i, word_t j);
	if(itf.rdy && itf.valid_o) begin
<<<<<<< HEAD
	    $display("i: %d, j: %d", i, j);
	    assert (itf.data_o == j) 
        else  begin
            $error("Reading data from FIFO failed: Got %d and expected %d.", itf.data_o, j);
            report_error(INCORRECT_DATA_O_ON_YUMI_I);
        end
=======
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        itf.valid_i <= 1;
        itf.data_i <= i;
        itf.yumi <= 1; 
        ##(1);
        itf.valid_i <= 0;
<<<<<<< HEAD
=======
        assert (itf.data_o == i) 
        else  begin
            $error("Reading data from FIFO failed: Got %d and expected %d.", itf.data_o, i);
            report_error(INCORRECT_DATA_O_ON_YUMI_I);
        end
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        itf.yumi <= 0;
    end
endtask : simultaneously


initial begin
    reset();
    /************************ Your Code Here ***********************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
	
<<<<<<< HEAD

    // First let's enqueue a bunch of crap. 
    $display("Enqueueing %d", 0);
    enqueue(0);
    for(word_t i = 1; i != 0; ++i) begin
=======
    // First let's enqueue a bunch of crap. 
    for(word_t i = 0; i < cap_p - 1; ++i) begin
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
        $display("Enqueueing %d", i);
        enqueue(i);
    end
    // Now dequeue it.
<<<<<<< HEAD
    $display("Dequeue %d", 0);
    dequeue(0);
    for(word_t i = 1; i != 0; ++i) begin
        $display("Dequeue %d", i);
        dequeue(i);
    end

    // Now simultaneous:
    $display("Simultaneous on %d", 0);
    enqueue(0);
    for(word_t i = 1; i != 0; ++i) begin
        $display("Simultaneous  %d", i);
        simultaneously(0, 0);
        enqueue(0);
    end

=======
    for(word_t i = 0; i < cap_p - 1; ++i) begin
        $display("Dequeueing %d", i);
        dequeue(i);
    end
    // Now do half of it and we'll simultaneously hold the other half. 
    for(word_t i = 0; i < cap_p >> 1; ++i) begin
        $display("Enqueueing %d", i);
        enqueue(i);
    end
    for(word_t i = 0; i < cap_p >> 1; ++i) begin
        $display("Enqueueing/dequeueing simultaneously %d", i);
        simultaneously(i, i);
    end
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    // Now try to reset it. 
    itf.reset_n = 0; // active low. 
    @(tb_clk);
    assert (itf.rdy)
    else begin
        $error("Expected READY when reset, but didn't receive that. ");
        report_error(RESET_DOES_NOT_CAUSE_READY_O);
    end

    /***************************************************************/
    // Make sure your test bench exits by calling itf.finish();
    itf.finish();
    $error("TB: Illegal Exit ocurred");
end

endmodule : testbench
`endif

