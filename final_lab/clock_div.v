module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);

   
    wire [DIVIDE_BY-1:0] Q;  
   
    genvar i;
    generate
        for(i = 0; i < DIVIDE_BY; i = i + 1) begin : gen_clkDff
            dff clkDff(
                .reset(reset),
                .D(~Q[i]),
                .Q(Q[i]),
                .clock(i == 0 ? clock : Q[i-1])
             );
        end
    endgenerate
    always@(posedge clock) begin
        div_clock <= Q[DIVIDE_BY-1];
    end


endmodule
