module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
    );
    
    dlatch equation1(
        .D(sw[0]),
        .En(btnC),
        .Q(led[0]),
        .notQ(led[1])
     );
    
    memory_system equation2(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led[15:8])
   );
    
endmodule
