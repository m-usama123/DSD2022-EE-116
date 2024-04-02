`timescale 1ns/1ns  
module lab8_tb (
    
   
);
logic clk;
logic reset;
logic direction;

logic [6:0]segment;
logic [7:0]display;

lab8 dut(
    
.clk(clk),
.reset(reset),
.direction(direction),
.display(display),  
.segment(segment)
);

initial begin
    clk=0;
    reset=1;
    direction=0;
    #800;
    reset=0;
    direction=1;
    #16s;
    direction=0;
    #16s;
end
initial begin
    clk=0;
    forever #5 clk=~clk;  
end
    
endmodule