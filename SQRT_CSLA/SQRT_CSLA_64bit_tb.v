`timescale 1ns/1ps

module SQRT_CSLA_64bit_tb();
    reg [63:0] A, B;
    reg Cin;
    wire [63:0] Sum;
    wire Cout;

    reg [64:0] correct_s;
    integer run_times = 100000;

    // Instantiate the DUT (Device Under Test)
    SQRT_CSLA_64bit DUT(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        repeat (run_times) begin
            A = $random;
            B = $random;
            Cin = $random % 2;
            correct_s = A + B + Cin;

            #2.0;
            if ({Cout, Sum} == correct_s)
                $display("Right! {Cout, Sum}=%h, correct_s=%h, time=%0t", {Cout, Sum}, correct_s, $realtime);
            else
                $display("Wrong! {Cout, Sum}=%h, correct_s=%h, time=%0t", {Cout, Sum}, correct_s, $realtime);
        end
        $finish;
    end
endmodule
