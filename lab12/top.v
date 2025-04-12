module top(
    input sw,             // w
    input btnC,           // clk
    input btnU,           // reset
    output [9:0] led      
);

    wire z_onehot, z_binary;
    wire [4:0] onehot_actual;
    wire [2:0] binary_actual;

    onehot eq1(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .one_hot_states(onehot_actual),
        .z(z_onehot)
    );

    binary eq2(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .state(binary_actual),
        .z(z_binary)
    );

    assign led = {binary_actual, onehot_actual, z_binary, z_onehot};  

endmodule
