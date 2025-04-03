module top(
    input [3:0] sw,
    input btnC,
    output [5:0] led
    );

    dflipflop eq1(
    .D(sw[0]),
    .clk(btnC),
    .Q(led[0]),
    .notQ(led[1])
    );
    
    jkflipflop eq2(
    .J(sw[1]),
    .K(sw[2]),
    .clk(btnC),
    .Q(led[2]),
    .notQ(led[3])
    );
    
    tflipflop eq3(
    .T(sw[3]),
    .clk(btnC),
    .Q(led[4]),
    .notQ(led[5])
    );
    
    
endmodule
