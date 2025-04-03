module jkflipflop(
    input J, K, clk,
    output  Q, 
    output notQ
    );

    wire dout;  // boolean equation
    
    assign dout = (Q & ~K) | (J & ~Q);
    
    
    dflipflop eq(
     .D(dout), 
     .clk(clk), 
     .Q(Q), 
     .notQ(notQ)
    );
    
endmodule
