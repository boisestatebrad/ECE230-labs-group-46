module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] AplusB,
    input [3:0] AminusB,
    input [3:0] anode,
    output reg [6:0] segs
);
    
    reg [3:0] selected_sig;
    
    always @(*) begin
        case (anode)
            4'b1110: selected_sig <= A;
            4'b1101: selected_sig <= B;
            4'b1011: selected_sig <= AplusB;
            4'b0111: selected_sig <= AminusB;
        endcase
    end
    
    // Decoder, provided free of charge!
    always @(*) begin
        case(selected_sig)
            //            GFEDCBA
            4'h0: segs  = 7'b1000000;        
            4'h1: segs  = 7'b1111001;        
            4'h2: segs  = 7'b0100100;        
            4'h3: segs  = 7'b0110000;        
            4'h4: segs  = 7'b0011001;        
            4'h5: segs  = 7'b0010010;        
            4'h6: segs  = 7'b0000010;        
            4'h7: segs  = 7'b1111000;        
            4'h8: segs  = 7'b0000000;
            4'h9: segs  = 7'b0010000;        
            4'hA: segs = 7'b0001000;        
            4'hB: segs = 7'b0000011;        
            4'hC: segs = 7'b1000110;        
            4'hD: segs = 7'b0100001;        
            4'hE: segs = 7'b0000110;        
            4'hF: segs = 7'b0001110;     
        endcase
    end

endmodule
