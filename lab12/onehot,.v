module binary(
    input w, clk, reset,
    output reg [2:0] state,
    output reg z
);

    reg [2:0] next_state;

    localparam A = 3'b000;
    localparam B = 3'b001;
    localparam C = 3'b010;
    localparam D = 3'b011;
    localparam E = 3'b100;

    always @(*) begin
        case (state)
            A: next_state = w ? D : B;
            B: next_state = w ? D : C;
            C: next_state = w ? D : C;
            D: next_state = w ? E : B;
            E: next_state = w ? E : B;
            default: next_state = A;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        z = (state == C) || (state == E);
    end

endmodule
