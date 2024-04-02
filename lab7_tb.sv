`timescale 1ns/1ns  
module lab7_tb();
logic clk;
logic reset;
logic write;
logic [3:0]num;
logic [2:0]sel;
logic [6:0]led;
logic [7:0]segment;
lab7 dut(.clk(clk),
.reset(reset),
.write(write),
.num(num),
.sel(sel),
.led(led),
.segment(segment));
initial begin
  clk=0; 
  reset=0;
  write=1;
  sel=3'h7;
  num=4'h2;
  #20;
  sel=3'h6;
  num=4'h0;
  #20;
  sel=3'h5;
  num=4'h2;
  #20;
  sel=3'h4;
  num=4'h2;
  #20;
  sel=3'h3;
  num=4'hE;
  #20;
  sel=3'h2;
  num=4'hE;
  #20;
  sel=3'h1;
  num=4'h1;
  #20; 
  sel=3'h0;
  num=4'h6;
  #20;
  write=0;
  #1s;
  write=1;
  #20;
  $stop;
    end

initial begin
  $display("reset=%h; write=%h;   num=%h; sel=%h;           segment=%h; led=%h",reset,write,num,sel,segment,led);
end
always #5 clk=~clk;

endmodule