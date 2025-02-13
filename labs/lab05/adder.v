module adder(
    input  A, B,
    output Y,
    output carryout
);

    assign Y = A ^ B;
    assign carryout = A & B;
    
endmodule