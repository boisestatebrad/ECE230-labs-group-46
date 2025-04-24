module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);

    reg [1:0] state;
    reg [1:0] next_state;

    always @(posedge div_clock or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            2'b00: next_state = 2'b01; 
            2'b01: next_state = 2'b10; 
            2'b10: next_state = 2'b11; 
            2'b11: next_state = 2'b00; 
            default: next_state = 2'b00;
        endcase
    end

    always @(*) begin
        case (state)
            2'b00: anode = 4'b1110; 
            2'b01: anode = 4'b1101; 
            2'b10: anode = 4'b1011; 
            2'b11: anode = 4'b0111; 
            default: anode = 4'b1111;
        endcase
    end

endmodule
