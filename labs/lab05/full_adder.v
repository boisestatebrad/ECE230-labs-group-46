module full_adder(
    input a, b, Cin,
    output y, Cout
);

assign y = a ^ b ^ Cin;
assign Cout = (b & Cin) | (a & b) | (a & Cin);


endmodule