module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire Anext, Bnext, Cnext, Dnext;
    
    dff_state Adff (
    .reset(reset),
    .clk(div_clock),
    .D(Anext),
    .Default(1'b0),
    .Q(anode[0])
    );
    
    dff_state Bdff (
    .reset(reset),
    .clk(div_clock),
    .D(Bnext),
    .Default(1'b1),
    .Q(anode[1])
    );
    
    dff_state Cdff (
    .reset(reset),
    .clk(div_clock),
    .D(Cnext),
    .Default(1'b1),
    .Q(anode[2])
    );
    
    dff_state Ddff (
    .reset(reset),
    .clk(div_clock),
    .D(Dnext),
    .Default(1'b1),
    .Q(anode[3])
    );
        
    assign Anext = anode[3];
    assign Bnext = anode[0];
    assign Cnext = anode[1];
    assign Dnext = anode[2]; 

endmodule
