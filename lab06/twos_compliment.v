module twos_compliment(
    input [7:0] A,
    input B,
    output [7:0] Y
);

    wire [6:0] carry;
    
    full_adder zero_bit(
        .A(~A[0]),
        .B(1'b1),
        .Y(Y[0]),
        .Cout(carry[0]),
        .Cin(1'b0)
    );
    
    full_adder one_bit(
        .A(~A[1]),
        .B(1'b0),
        .Y(Y[1]),
        .Cout(carry[1]),
        .Cin(carry[0])
    );
    
    full_adder two_bit(
        .A(~A[2]),
        .B(1'b0),
        .Y(Y[2]),
        .Cout(carry[2]),
        .Cin(carry[1])
    );
    
    full_adder three_bit(
        .A(~A[3]),
        .B(1'b0),
        .Y(Y[3]),
        .Cout(carry[3]),
        .Cin(carry[2])
    );
    
    full_adder four_bit(
        .A(~A[4]),
        .B(1'b0),
        .Y(Y[4]),
        .Cout(carry[4]),
        .Cin(carry[3])
    );
    
    full_adder five_bit(
        .A(~A[5]),
        .B(1'b0),
        .Y(Y[5]),
        .Cout(carry[5]),
        .Cin(carry[4])
    );
    
    full_adder six_bit(
        .A(~A[6]),
        .B(1'b0),
        .Y(Y[6]),
        .Cout(carry[6]),
        .Cin(carry[5])
    );
    
    full_adder seven_bit(
        .A(~A[7]),
        .B(1'b0),
        .Y(Y[7]),
        .Cin(carry[6])
    );


endmodule
