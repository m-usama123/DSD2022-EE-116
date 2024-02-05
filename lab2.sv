module lab2 (output logic x, y,
         input logic a, b, c
);
logic d,e,f,g,h;
always_comb begin 

d = (a||b);
e = ~c;
x = (p^q);
f = ~(a&b);
g = (a|b);
h = (m^e); 
y = (q&f); 
    
end
    
endmodule