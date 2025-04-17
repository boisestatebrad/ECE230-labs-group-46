module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);

    wire [DIVIDE_BY-1:0] dff_out;
    wire [DIVIDE_BY-1:0] dff_in;

    assign dff_in[0] = ~dff_out[0];

    assign dff_in[DIVIDE_BY-1:1] = dff_out[DIVIDE_BY-2:0];

    always @ (posedge clock or posedge reset) begin
        if (reset)
            div_clock <= 1'b0;
        else
            div_clock <= dff_out[DIVIDE_BY-1];
    end

    genvar i;
    generate
        for (i = 0; i < DIVIDE_BY; i = i + 1) begin : divider
            dff u_dff (
                .reset(reset),
                .clock(clock),
                .D(dff_in[i]),
                .Q(dff_out[i]),
                .NotQ() 
            );
        end
    endgenerate

endmodule