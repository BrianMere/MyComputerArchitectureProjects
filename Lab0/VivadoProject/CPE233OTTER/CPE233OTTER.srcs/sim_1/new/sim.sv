`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generated Sim file. 
//////////////////////////////////////////////////////////////////////////////////


module sim(
    );

    logic clk, btnc, ps2clk, ps2data, vga_hs, vga_vs;
    logic [3:0] anodes;
    logic [7:0] cathodes, vga_rgb;
    logic [15:0] sw, leds;

        OTTER_Wrapper cpu(
            .CLK(clk),
            .BTNC(btnc),
            .SWITCHES(sw),
            .PS2CLK(ps2clk),
            .PS2DATA(ps2data),
            .LEDS(leds),
            .CATHODES(cathodes),
            .ANODES(anodes),
            .VGA_RGB(vga_rgb),
            .VGA_HS(vga_hs),
            .VGA_VS(vga_vs)
    );

    initial begin
        // define initial vals here (can keep undefined)
        clk = 0;
        btnc =0;
        ps2clk=0;
        ps2data=0;
        vga_hs=0;
        vga_vs=0;
        anodes = 4'b0;
        cathodes = 8'b0;
        vga_rgb = 8'b0;
        sw = 16'b0;
        leds = 16'b0;

        forever begin
            #1 clk = ~clk;
            #1 clk = ~clk;
        end
    end

endmodule
