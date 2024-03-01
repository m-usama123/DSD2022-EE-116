module lab4_part2_tb;
logic [3:0]num;
logic [2:0]s;
logic a, b, c, d, e, f, g, A0, A1, A2, A3, A4, A5, A6, A7;
lab4_part2 dut(
    .num(num),
    .s(s),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .A0(A0),
    .A1(A1),
    .A2(A2), 
    .A3(A3),
    .A4(A4),
    .A5(A5),
    .A6(A6),
    .A7(A7)
);
initial begin
    for(int i; i<8; i=i+1)begin
        s = i;
        for(int j; j<16; j=j+1)begin
            num = j;
            #10;
        end
    end
end
initial begin
    $monitor("s=%h;num=%b;a=%b;b=%b;c=%b;d=%b;e=%b;f=%b;g=%b     A0=%b;A1=%b;A2=%b;A3=%b;A4=%b;A5=%b;A6=%b;A7=%b",s,num,a,b,c,d,e,f,g,A0,A1,A2,A3,A4,A5,A6,A7);
end
endmodule