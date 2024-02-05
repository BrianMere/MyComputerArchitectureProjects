import mult_types::*;

module testbench(multiplier_itf.testbench itf);

add_shift_multiplier dut (
    .clk_i          ( itf.clk          ),
    .reset_n_i      ( itf.reset_n      ),
    .multiplicand_i ( itf.multiplicand ),
    .multiplier_i   ( itf.multiplier   ),
    .start_i        ( itf.start        ),
    .ready_o        ( itf.rdy          ),
    .product_o      ( itf.product      ),
    .done_o         ( itf.done         )
);

assign itf.mult_op = dut.ms.op;
default clocking tb_clk @(negedge itf.clk); endclocking

// error_e defined in package mult_types in file types.sv
// Asynchronously reports error in DUT to grading harness
function void report_error(error_e error);
    itf.tb_report_dut_error(error);
endfunction : report_error


// Resets the multiplier
task reset();
    itf.reset_n <= 1'b0;
    ##5;
    itf.reset_n <= 1'b1;
    ##1;
endtask : reset

// DO NOT MODIFY CODE ABOVE THIS LINE

/* Uncomment to "monitor" changes to adder operational state over time */
//initial $monitor("dut-op: time: %0t op: %s", $time, dut.ms.op.name);


initial itf.reset_n = 1'b0;

initial begin
    reset();
    /********************** Your Code Here *****************************/
    ##(1); // ensure that the device is in a stable state. 

    for(int i = 0; i < operand_limit << width_p; ++i) begin
        // first, test multiplications
        itf.start <= 1;
        itf.multiplier <= i[width_p-1: 0];
        itf.multiplicand <= i[width_p*2-1: width_p];
        ##(1);
        $display("Testing %d * %d", itf.multiplier, itf.multiplicand);
        @(tb_clk iff (itf.done)); //delay until we have a done state. 
            assert (itf.product == itf.multiplier * itf.multiplicand)
            else begin 
                $error("BAD_PRODUCT error detected");
                $error("Testing %d * %d, dut outputs: %d while expects %d",
                itf.multiplier,
                itf.multiplicand,
                itf.product,
                itf.multiplier * itf.multiplicand
                );
                report_error(BAD_PRODUCT);
            end
<<<<<<< HEAD
         itf.start <= 0;
         ##(1);
         // on completion of a multiplication, assert that the ready_o signal is high.
         assert(itf.rdy) 
         else begin
             $error("NOT_READY error detected on end of multiplication");
             $error("Testing %d * %d when ending mult.", itf.multiplier, itf.multiplicand);
             report_error(NOT_READY);
         end
         ##(1);

    end

    // second, test resets
    itf.multiplier <= 243;
    itf.multiplicand <= 123;
    itf.start <= 1;
    ##(1);
    itf.reset_n <= 0; // set the reset input (active low) to reset the thing
    ##(1);
    itf.reset_n <= 1;
    @(tb_clk iff (itf.mult_op == ADD));
    itf.reset_n <= 0;
    ##(1);
    assert(itf.rdy)
    else begin
        $error("NOT_READY error detected on reset");
        $error("Testing %d * %d with resets", itf.multiplier, itf.multiplicand);
        report_error(NOT_READY);  
    end
    itf.start <= 0;
    ##(1);
    itf.start <= 1;
    ##(1);
    itf.reset_n <= 0; // set the reset input (active low) to reset the thing
    ##(1);
    itf.reset_n <= 1;
    @(tb_clk iff (itf.mult_op == SHIFT));
    itf.reset_n <= 0;
    ##(1);
    assert(itf.rdy)
    else begin
        $error("NOT_READY error detected on reset");
        $error("Testing %d * %d with resets", itf.multiplier, itf.multiplicand);
        report_error(NOT_READY);  
=======
        itf.start <= 0;
        ##(1);
        // on completion of a multiplication, assert that the ready_o signal is high.
        assert(itf.rdy) 
        else begin
            $error("NOT_READY error detected on end of multiplication");
            $error("Testing %d * %d when ending mult.", itf.multiplier, itf.multiplicand);
            report_error(NOT_READY);
        end
        ##(1);

        // second, test resets
        itf.start <= 0;
        ##(1);
        itf.reset_n <= 0; // set the reset input (active low) to reset the thing
        ##(1);
        itf.reset_n <= 1;
        ##(1);
        assert(!itf.rdy)
        else begin
            $error("NOT_READY error detected on reset");
            $error("Testing %d * %d with resets", itf.multiplier, itf.multiplicand);
            report_error(NOT_READY);  
        end
        ##(1);
>>>>>>> 9caa3ed5f85a47f702de96847123835bab7c53cc
    end

    /*******************************************************************/
    itf.finish(); // Use this finish task in order to let grading harness
                  // complete in process and/or scheduled operations
    $error("Improper Simulation Exit");
end

endmodule : testbench
