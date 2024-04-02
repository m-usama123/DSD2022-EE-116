module lab8 (
    input logic reset ,
     logic clk ,
     logic direction ,
    output logic [7:0]display,
     logic [6:0]segment
);
logic[2:0] t_selector;

logic clock_2 = 0;
logic[25:0] count_scroll;

logic clock_1 = 0; 
logic[16:0] count_blnk;

logic[3:0]q; 

logic[3:0] q1 ;
logic[3:0] q2 ;
logic[3:0] q3 ;
logic[3:0] q4 ;
logic[3:0] q5 ;
logic[3:0] q6 ;
logic[3:0] q7 ;
logic[3:0] q8 ;
logic[3:0] q9 ;
logic[3:0] q10;
logic[3:0] q11;
logic[3:0] q12;
logic[3:0] q13;
logic[3:0] q14;
logic[3:0] q15;
logic[3:0] q16;



//"blinking rate controller"

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        clock_1 <= 0;
        count_blnk <= 0;
    end
    else begin
        if (count_blnk == 17'd124999) begin 
            clock_1 <= ~clock_1;
            count_blnk <= 0;
        end
        else begin
            count_blnk <= count_blnk + 1;
        end
        
    end
    
end





//"for controlling the scrolling speed of numbers"

always_ff @(posedge clk or  posedge reset) begin
    if (reset) begin
        count_scroll <= 0;
        clock_2 <= 0;
    end
    else begin
        if (count_scroll == 26'd49999999) begin
            clock_2 <= ~clock_2;
            count_scroll <= 0;
        end
        else begin
            count_scroll = count_scroll + 1;
        end
end
end






always_comb begin
    if (reset) begin
        t_selector[0] = 0;
    end
    else begin
        t_selector[0] =clock_1;
    end
    
end
always_ff @(posedge clock_1 or posedge reset) begin
    if (reset) begin
        t_selector[1] <= 0;
    end
    else begin
        t_selector[1] <= ~t_selector[1];
    end
    
end
always_ff @(posedge t_selector[1] or posedge reset) begin
    if (reset) begin
        t_selector[2] <= 0;
    end
    else begin
        t_selector[2] <= ~t_selector[2];
    end
    
end


always_comb begin
    case (t_selector)
        3'h0 : q <= q1;
        3'h1 : q <= q2;
        3'h2 : q <= q3;
        3'h3 : q <= q4;
        3'h4 : q <= q5;
        3'h5 : q <= q6;
        3'h6 : q <= q7;
        3'h7 : q <= q8;
        
        default: begin
            q = 4'b0000;
        end
    endcase
    
end




always_ff @( posedge clock_1 or  posedge reset ) begin 
    

    if (reset) begin
        q1 = 4'b0010;
        q2 = 4'b0000;
        q3 = 4'b0010;
        q4 = 4'b0010;
        q5 = 4'b1110;
        q6 = 4'b1110;
        q7 = 4'b0001;
        q8 = 4'b0001;
        q9 = 4'b0110;
        q10 = 4'b1111;
        q11 = 4'b1111;
        q12 = 4'b1111;
        q13 = 4'b1111;
        q14 = 4'b1111;
        q15 = 4'b1111;
        q16 = 4'b1111;
        
    end
    else begin
        if (direction) begin
            q1 <= q2;
            q2 <= q3;
            q3 <= q4;
            q4 <= q5;
            q5 <= q6;
            q6 <= q7;
            q7 <= q8;
            q8 <= q9;
            q9 <= q10;
            q10 <= q11;
            q11 <= q12;
            q12 <= q13;
            q13 <= q14;
            q14 <= q15;
            q15 <= q1;
        end
        else begin
            q1 <= q16;
            q2 <= q1;
            q3 <= q2;
            q4 <= q3;
            q5 <= q4;
            q6 <= q5;
            q7 <= q6;
            q8 <= q7;
            q9 <= q8;
            q10 <= q9;
            q11 <= q10;
            q12 <= q11;
            q13 <= q12;
            q14 <= q15;
            q16 <= q15;    
        end
    end    
end
always_comb begin
    case (q)
         4'h0 : segment = 7'b0000001;
         4'h1 : segment = 7'b1001111;
         4'h2 : segment = 7'b0010010;
         
         4'h4 : segment = 7'b1001100;
         
         4'hE : segment = 7'b0110000;
        

        default: begin
            segment = 7'b1111111;
        end
    endcase
end

always_comb begin
    
    case (t_selector)
    3'h0 : display = 8'b11111110;
    3'h1 : display = 8'b11111101;
    3'h2 : display = 8'b11111011;
    3'h3 : display = 8'b11110111;
    3'h4 : display = 8'b11101111;
    3'h5 : display = 8'b11011111;
    3'h6 : display = 8'b10111111;
    3'h7 : display = 8'b01111111;
        default: begin
            display = 8'b11111111;
        end
    endcase
    
    
    
end


    
endmodule