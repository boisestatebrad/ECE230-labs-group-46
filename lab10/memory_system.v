module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
    );
    
    wire [7:0] x[3:0];
    wire [7:0] y[3:0];
    wire z0,z1,z2,z3;
    
    byte_memory byte1(
        .data(x[0]),
        .memory(y[0]),
        .store(z0)
    );
    
    byte_memory byte2(
        .data(x[1]),
        .memory(y[1]),
        .store(z1)
    );
    
    byte_memory byte3(
        .data(x[2]),
        .memory(y[2]),
        .store(z2)
    );
    
    byte_memory byte4(
        .data(x[3]),
        .memory(y[3]),
        .store(z3)
    );
    
    eightdemux demux1(
        .data(data),
        .A(x[0]),
        .B(x[1]),
        .C(x[2]),
        .D(x[3]),
        .addr(addr)
    );
    
    onedemux deumx2(
        .data(store),
        .addr(addr),
        .A(z0),
        .B(z1),
        .C(z2),
        .D(z3)
    );
    
    multiplexer mux(
        .A(y[0]),
        .B(y[1]),
        .C(y[2]),
        .D(y[3]),
        .addr(addr),
        .memory(memory)
    );
   
    

endmodule
