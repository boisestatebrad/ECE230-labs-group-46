module ones_compliment(
    input [3:0] A, B,
    output [3:0] Y
);

    wire [3:0] APlusB;
    wire [3:0] carry;
    wire around;
    wire [3:0] second_carry;
    
    full_adder zero_bit(
        .A(A[0]),
        .B(~B[0]),
        .Y(APlusB[0]),
        .Cout(carry[0]),
        .Cin(1'b0)
    );
    
    full_adder one_bit(
        .A(A[1]),
        .B(~B[1]),
        .Cin(carry[0]),
        .Y(APlusB[1]),
        .Cout(carry[1])
    );
    
    full_adder two_bit(
       .A(A[2]),
       .B(~B[2]),
       .Cin(carry[1]),
       .Y(APlusB[2]),
       .Cout(carry[2])
    );
    
    full_adder three_bit(
        .A(A[3]),
       .B(~B[3]),
       .Cin(carry[2]),
       .Y(APlusB[3]),
       .Cout(around)
    );
    
    full_adder zero_bitcarry(
        .A(APlusB[0]),
       .B(1'b0),
       .Cin(around),
       .Y(Y[0]),
       .Cout(second_carry[0])
    );
    
    full_adder one_bitcarry(
        .A(APlusB[1]),
        .B(1'b0),
        .Cin(second_carry[0]),
        .Y(Y[1]),
        .Cout(second_carry[1])
    );
    
    full_adder two_bitcarry(
        .A(APlusB[2]),
        .B(1'b0),
        .Cin(second_carry[1]),
        .Y(Y[2]),
        .Cout(second_carry[2])
    );
    
    full_adder three_bitcarry(
        .A(APlusB[3]),
        .B(1'b0),
        .Cin(second_carry[2]),
        .Y(Y[3])
    );
        

endmodule