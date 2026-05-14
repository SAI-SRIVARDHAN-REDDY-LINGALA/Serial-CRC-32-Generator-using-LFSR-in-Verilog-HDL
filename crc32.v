module crc32_serial (
    input  wire       clk,
    input  wire       rst,
    input  wire       enable,
    input  wire       data_in,

    output reg [31:0] crc_out
);

    // Standard CRC-32 Polynomial
    parameter POLY = 32'h04C11DB7;

    reg feedback;

    always @(posedge clk or posedge rst) begin

        if (rst) begin
            // Initial CRC value
            crc_out <= 32'hFFFFFFFF;
        end

        else if (enable) begin

            // Feedback calculation
            feedback = crc_out[31] ^ data_in;

            // Shift operation
            crc_out = crc_out << 1;

            // If feedback is 1, apply polynomial XOR
            if (feedback)
                crc_out = crc_out ^ POLY;
        end
    end

endmodule