`timescale 1ns / 1ps

module alu_8bit_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] Sel;

    // Outputs
    wire [7:0] Result;
    wire Carry;

    // Instantiate the ALU
    alu_8bit uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .Carry(Carry)
    );

    initial begin
        $display("------------------------------------------------------------");
        $display(" Time\tSel\tA\tB\tResult\tCarry");
        $display("------------------------------------------------------------");

        // Test Addition
        A = 8'd25; B = 8'd15; Sel = 3'b000;
        #10;
        $display("%0t\t%b\t%d\t%d\t%d\t%b", $time, Sel, A, B, Result, Carry);

        // Test Subtraction
        A = 8'd30; B = 8'd10; Sel = 3'b001;
        #10;
        $display("%0t\t%b\t%d\t%d\t%d\t%b", $time, Sel, A, B, Result, Carry);

        // Test AND
        A = 8'b11001100; B = 8'b10101010; Sel = 3'b010;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        // Test OR
        A = 8'b11001100; B = 8'b10101010; Sel = 3'b011;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        // Test XOR
        A = 8'b11001100; B = 8'b10101010; Sel = 3'b100;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        // Test NOT
        A = 8'b11001100; B = 8'b00000000; Sel = 3'b101;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        // Test Left Shift
        A = 8'b00001111; B = 8'b00000000; Sel = 3'b110;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        // Test Right Shift
        A = 8'b11110000; B = 8'b00000000; Sel = 3'b111;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, Sel, A, B, Result, Carry);

        $display("------------------------------------------------------------");
        $display("Simulation Completed Successfully.");
        $display("------------------------------------------------------------");

        $finish;
    end

endmodule