module binary(
    input w,clk, reset,
    output [2:0] state,
    output z
);

wire [2:0] next;

assign z = (state[2] & (state[1] | ~state[0]));

assign next[0] = (~state[0] & ~state[1] & ~state[2]) | (w & ((state[0] & ~state[1]) | (state[1] & ~state[0])) | 
(~w & ((state[0] & state[1]) | (state[2]))));

assign next[1] = (~w & ((state[0] & ~state[1]) | (state[1] & state[0]) | (w & ((~state[0] & ~state[1] & ~ state[3]) | 
(state[0] & ~state[1]) | (state[1] & ~state[0])))));

assign next[2] = w & ((state[0] & state[1]) | (state[2]));

dff zero(
    .Default(1'b0),
    .D(next[0]),
    .clk(clk),
    .reset(reset),
    .Q(state[0])
);

dff one(
    .Default(1'b0),
    .D(next[1]),
    .clk(clk),
    .reset(reset),
    .Q(state[1])
);

dff two(
    .Default(1'b0),
    .D(next[2]),
    .clk(clk),
    .reset(reset),
    .Q(state[2])
);

endmodule
