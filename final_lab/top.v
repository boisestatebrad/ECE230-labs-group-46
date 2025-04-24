module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);

    wire clock;
    wire [3:0] AplusB;
    wire [3:0] AminusB;
    wire [3:0] A;
    wire [3:0] B;
    
    assign A = sw[3:0];
    assign B = sw[7:4];
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY)) clockout (
        .reset(btnC),
        .clock(clk),
        .div_clock(clock)
    );
    seven_seg_scanner scanner_in (
        .div_clock(clock),
        .reset(btnC),
        .anode(an)
    );
    seven_seg_decoder decoder (
        .A(A),
        .B(B),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(an),
        .segs(seg)
    );
    
    math_block maths (
        .A(A),
        .B(B),
        .AminusB(AminusB),
        .AplusB(AplusB)
    );

endmodule
