module onehot(
    input w, clk, reset,
   output z,
   output [4:0] one_hot_states
);

wire Anext, Bnext, Cnext, Dnext, Enext, Astate, Bstate, Cstate, Dstate, Estate;

assign z = Estate | Cstate;

assign Anext = 0;
assign Bnext = (Astate & ~w) | (Dstate & ~w) | (Estate & ~ w);
assign Cnext = (Bstate & ~w) | (Cstate & ~w); 
assign Dnext = (Astate & w) | (Bstate & w) | (Cstate & w);
assign Enext = (Dstate & w) | (Estate & w);

assign one_hot_states= {Estate,Dstate,Cstate,Bstate,Astate};

dff Adff(
    .Default(1'b1),
    .D(Anext),
    .clk(clk),
    .reset(reset),
    .Q(Astate)
);

dff Bdff(
    .Default(1'b0),
    .D(Bnext),
    .clk(clk),
    .reset(reset),
    .Q(Bstate)
);

dff Cdff(
    .Default(1'b0),
    .D(Cnext),
    .clk(clk),
    .reset(reset),
    .Q(Cstate)
);

dff Ddff(
    .Default(1'b0),
    .D(Dnext),
    .clk(clk),
    .reset(reset),
    .Q(Dstate)
);

dff Edff(
    .Default(1'b0),
    .D(Enext),
    .clk(clk),
    .reset(reset),
    .Q(Estate)
);

endmodule
