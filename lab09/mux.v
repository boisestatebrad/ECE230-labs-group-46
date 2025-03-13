module mux(
input [1:0] sel,  //0 1 2 3  00 01 10 11
input [3:0] Ceo, Own, Fred, Jill, 
input btnC,
output [3:0] Y
);

assign Y = btnC ? (sel == 2'b00 ? Ceo : 
    sel == 2'b01 ? Own : 
    sel == 2'b10 ? Fred : 
    sel == 2'b11 ? Jill : 0) : 0;

endmodule
