`timescale 1ns/1ps

module tb_crc32_serial;

    reg clk;
    reg rst;
    reg enable;
    reg data_in;

    wire [31:0] crc_out;

    // DUT
    crc32_serial uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .data_in(data_in),
        .crc_out(crc_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk     = 0;
        rst     = 1;
        enable  = 0;
        data_in = 0;

        // Reset
        #20;
        rst = 0;
        enable = 1;

        // Send serial data bits
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;

        enable = 0;

        #50;

        $finish;
    end

endmodule