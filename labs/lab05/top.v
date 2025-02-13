module top(
    input [7:0]sw,
    output [5:0]led
);

light stair_light(
    .downstairs(sw[0]),
    .upstairs(sw[1]),
    .stair_light(led[0]) 
);

adder equation1(
    .A(sw[2]),
    .B(sw[3]),
    .Y(led[1]),
    .carryout(led[2])
);

wire x;

full_adder equation2(
    .a(sw[4]),
    .b(sw[6]),
    .Cin(0),
    .y(led[3]),
    .Cout(x)
);

full_adder equation3(
    .a(sw[5]),
    .b(sw[7]),
    .Cin(x),
    .y(led[4]),
    .Cout(led[5])
);

endmodule