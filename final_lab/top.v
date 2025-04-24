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
  wire x;
  wire [3:0] anodeout, AplusB_out, AminusB_out;
    
    clock_div one (
        .clock(clk),
        .reset(btnC),
        .div_clock(x)
    );
    
    seven_seg_scanner two(
        .div_clock(x),
        .reset(btnC),
        .anode(anodeout)
    );
    
    math_block three(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB_out),
        .AminusB(AminusB_out)
    );
    
    seven_seg_decoder four(
        .anode(anodeout),
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB_out),
        .AminusB(AminusB_out),
        .segs(seg[6:0])
        );
       
       assign anodeout = an[3:0];
        
    
    
    // Instantiate the clock divider...
    // ... wire it up to the scanner
    // ... wire the scanner to the decoder

    // Wire up the math block into the decoder

    // Do not forget to wire up resets!!

endmodule
