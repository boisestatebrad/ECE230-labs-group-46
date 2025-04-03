module tflipflop(
    input T, clk,
    output reg Q, 
    output notQ
    );
    
    initial begin 
        Q <= 0;
    end
    
    always @ (posedge clk) begin
        if (T & clk)
            Q = ~Q;
    end
    
    assign notQ = ~Q;
    
endmodule
