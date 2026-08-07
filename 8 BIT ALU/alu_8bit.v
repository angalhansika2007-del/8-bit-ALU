module alu_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] Sel,
    output reg [7:0] Result,
    output reg Carry
);

always @(*) begin
    // Default values
    Result = 8'b00000000;
    Carry  = 1'b0;

    case (Sel)
        3'b000: begin
            // Addition
            {Carry, Result} = A + B;
        end

        3'b001: begin
            // Subtraction
            {Carry, Result} = A - B;
        end

        3'b010: begin
            // Bitwise AND
            Result = A & B;
        end

        3'b011: begin
            // Bitwise OR
            Result = A | B;
        end

        3'b100: begin
            // Bitwise XOR
            Result = A ^ B;
        end

        3'b101: begin
            // Bitwise NOT
            Result = ~A;
        end

        3'b110: begin
            // Left Shift
            Result = A << 1;
        end

        3'b111: begin
            // Right Shift
            Result = A >> 1;
        end

        default: begin
            Result = 8'b00000000;
            Carry  = 1'b0;
        end
    endcase
end

endmodule