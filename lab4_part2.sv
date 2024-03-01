module lab4_part2(
    input logic[3:0]num, [2:0]s, 
    output logic 
    a, b, c, d, e, f, g, A0, A1, A2, A3, A4, A5, A6, A7

);
always_comb begin
    a = (~num[3] && num[2] && ~num[1] && ~num[0]) || (~num[3] && ~num[2] && ~num[1] && num[0]) || (num[3] && num[2] && ~num[1] && num[0]) || (num[3] && ~num[2] && num[1] && num[0]);
    b = (~num[3] && num[2] && ~num[1] && num[0]) || (num[3] && num[2] && ~num[0]) || (num[2] && num[1] && ~num[0]) || (num[3] && num[1] && num[0]);
    c = (~num[3] && ~num[2] && num[1] && ~num[0]) || (num[3] && num[2] && ~num[0]) || (num[3] && num[2] && num[1]);
    d = (~num[3] && ~num[2] && ~num[1] && num[0]) || (~num[3] && num[2] && ~num[1] && ~num[0]) || (num[2] && num[1] && num[0]) || (num[3] && ~num[2] && num[1] && ~num[0]);
    e = (~num[3] && num[0]) || (~num[2] && ~num[1] && num[0]) || (~num[3] && num[2] && ~num[1]);
    f = (~num[3] && ~num[2] && num[0]) || (~num[3] && ~num[2] && num[1]) || (~num[3] && num[1] && num[0]) || (num[3] && num[2] && ~num[1] && num[0]);
    g = (~num[3] && ~num[2] && ~num[1]) || (~num[3] && num[2] && num[1] && num[0]) || (num[3] && num[2] && ~num[1] && ~num[0]);

    A0 = (s[2] || s[1] || s[0]);
    A1 = (s[2] || s[1] || ~ s[0]);
    A2 = (s[2] || ~s[1] || s[0]);
    A3 = (s[2] || ~s[1] || ~s[0]);
    A4 = (~s[2] || s[1] || s[0]); 
    A5 = (~s[2] || s[1] || ~s[0]);
    A6 = (~s[2] || ~s[1] || s[0]);
    A7 = (~s[2] || ~s[1] || ~s[0]);

end
endmodule 
