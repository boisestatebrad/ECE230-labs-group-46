module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [2:0] carry;
    
    wire [2:0] borrow;
    
    full_adder zero_bit(
        .A(~A[0]),
        .B(1'b1),
        .Y(AplusB[0]),
        .Cout(carry[0]),
        .Cin(1'b0)
    );
    
    full_adder one_bit(
        .A(~A[1]),
        .B(1'b0),
        .Y(AplusB[1]),
        .Cout(carry[1]),
        .Cin(carry[0])
    );
    
    full_adder two_bit(
        .A(~A[2]),
        .B(1'b0),
        .Y(AplusB[2]),
        .Cout(carry[2]),
        .Cin(carry[1])
    );
    
    full_adder three_bit(
        .A(~A[3]),
        .B(1'b0),
        .Y(AplusB[3]),
        .Cin(carry[2])
    );
   
    full_subtractor sub_bit0(
        .A(A[0]),
        .B(B[0]),
        .Bin(1'b0),
        .D(AminusB[0]),
        .Bout(borrow[0])
    );
    
    full_subtractor sub_bit1(
        .A(A[1]),
        .B(B[1]),
        .Bin(borrow[0]),
        .D(AminusB[1]),
        .Bout(borrow[1])
    );
    
    full_subtractor sub_bit2(
        .A(A[2]),
        .B(B[2]),
        .Bin(borrow[1]),
        .D(AminusB[2]),
        .Bout(borrow[2])
    );
    
    full_subtractor sub_bit3(
        .A(A[3]),
        .B(B[3]),
        .Bin(borrow[2]),
        .D(AminusB[3]),
        .Bout(borrow[3])
    );


endmodule
