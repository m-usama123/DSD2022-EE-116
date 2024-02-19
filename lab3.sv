module lab3(input logic a,b,c, 
     output logic x,y

);
always_comb begin

x = (~c ^(a || b));
y = ((a || b)&((~(a&b)) ^ (a || b)));


    end

endmodule  

