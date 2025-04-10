module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

onehot eq1(
    .w(sw),
    .clk(btnC),
    .reset(btnU),
    .one_hot_states(led[6:2]),
    .z(led[0])
);

binary eq2(
    .w(sw),
    .clk(btnC),
    .reset(btnU),
    .z(led[1]),
    .state(led[9:7])
);

endmodule
