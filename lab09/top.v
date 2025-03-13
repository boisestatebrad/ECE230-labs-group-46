module top(
    input [15:0] sw,
    input btnC, btnU, btnD, btnR, btnL,
    output [15:0] led
    );

wire [3:0] x; 

mux equation1(
    .btnC(~btnC),
    .sel({btnL, btnU}),
    .Ceo(sw[3:0]),
    .Own(sw[7:4]),
    .Fred(sw[11:8]),
    .Jill(sw[15:12]),
    .Y(x)
);

demux equation2(
    .btnC(~btnC),
    .sel({btnD, btnR}),
    .Ceo(led[3:0]),
    .Own(led[7:4]),
    .Fred(led[11:8]),
    .Jill(led[15:12]),
    .Y(x)
);
    
endmodule
