module full_adder(
    input A, B, Cin,
    output Y, Cout
);

assign Y = A ^ B ^ Cin;
assign Cout = (B & Cin) | (A & B) | (A & Cin);


endmodule
