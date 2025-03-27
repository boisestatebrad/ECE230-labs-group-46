module dlatch(
    input D, En,
    output reg Q, 
    output notQ
    );
    
    always @ (En) begin
        if (En)
            Q <= D;
    end
    
    assign notQ = ~Q;
    
endmodule
