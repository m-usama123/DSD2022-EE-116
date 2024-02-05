`timescale 1ns/10ps
module lab2_tb();
logic a1;
logic b1;
logic c1;
logic y1;
localparam period=10;
lab2 uut(.a(a1) , .b(b1) , .c(c1) , .y(y1) , .x(x1));
initial begin
    a1 = 0 ; b1 = 0 ; c1 = 0;
    #period;
    a1 = 0 ; b1 = 0 ; c1 = 1;
    #period;
    a1 = 0 ; b1 = 1 ; c1 = 0;
    #period;
    a1 = 0 ; b1 = 1 ; c1 = 1;
    #period;
    a1 = 1 ; b1 = 0 ; c1 = 0;
    #period;
    a1 = 1 ; b1 = 0 ; c1 = 1;
    #period;
    a1 = 1 ; b1 = 1 ; c1 = 0;
    #period;
    a1 = 1 ; b1 = 1 ; c1 = 1;
    #period;
    $stop;
end
initial
begin
    $monitor("y = %b , a = %b , b = %b , c = %b , x = %b" , y1 , a1 , b1 , c1 , x1);
end
endmodule

