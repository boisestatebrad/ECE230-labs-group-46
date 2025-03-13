module demux(
    input [3:0] Y,
    input btnC,
    input [1:0] sel,
    output [3:0] Ceo, Own, Fred, Jill
    );
    
    assign Ceo = btnC ? (sel == 2'b00 ? Y : 0) : 0;
    assign Own = btnC ? (sel == 2'b01 ? Y : 0) : 0;
    assign Fred = btnC ? (sel == 2'b10 ? Y : 0) : 0;
    assign Jill = btnC ? (sel == 2'b11 ? Y : 0) : 0;
    
endmodule
