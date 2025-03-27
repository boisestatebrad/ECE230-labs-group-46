module multiplexer(
    output reg [7:0] memory,
    input [1:0] addr,
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [7:0] D
);
    always @(*) begin
        case (addr) 
        2'b00: memory = A;
        2'b01: memory = B;
        2'b10: memory = C;
        2'b11: memory = D;
        endcase
    end
    
endmodule
