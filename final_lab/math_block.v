module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [3:0] negB;
    wire [3:0] carry_plus;
    wire [3:0] carry_minus;
    
    twos_compliment eq1(
    .A(B[3:0]),
    .out(negB[3:0])
    );
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
        wire Cplus;
        wire Cminus;
        assign Cadd = (i==0) ? 1'b0 : carry_plus[i - 1]; 
        assign Cminus = (i==0) ? 1'b0 : carry_minus[i-1];
            
            full_adder plus (
                .A(A[i]),
                .B(B[i]),
                .Cin(Cadd),
                .Cout(carry_plus[i]),
                .Y(AplusB[i])
            );
            
            full_adder minus (
                .A(A[i]),
                .B(negB[i]),
                .Cin(Cminus),
                .Cout(carry_minus[i]),
                .Y(AminusB[i])
            );
        end
    endgenerate 
    
endmodule
