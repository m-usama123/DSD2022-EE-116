module lab7(
    input logic clk,
     logic reset,
     logic write,
     logic [2:0]sel, 
     logic [3:0]num,
    output logic[7:0]segment,
     logic[6:0]led
);
logic[4:0]storage;
logic [3:0] q;
logic[3:0] q1;
logic[3:0] q2;
logic[3:0] q3;
logic[3:0] q4;
logic[3:0] q5;
logic[3:0] q6;
logic[3:0] q7;
logic[3:0] q8;
logic clock = 0;
logic[2:0] t_selector;
logic[16:0] count;


always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        clock <= 0;
        count <= 0;
    end
    else begin
        if (count == 17'd124999) begin 
            clock <= ~clock;
            count <= 0;
        end
        else begin
            count <= count+1;
        end
        
    end
    
end


always_ff @(posedge clk, posedge reset) begin
    if (reset) begin
        q1 <= 0;
        q2 <= 0;
        q3 <= 0;
        q4 <= 0;
        q5 <= 0;
        q6 <= 0;
        q7 <= 0;
        q8 <= 0;
        
    end
    else if (write) begin
        case (sel)
        3'h0 : q1 <= num;
        3'h1 : q2 <= num;
        3'h2 : q3 <= num;
        3'h3 : q4 <= num;
        3'h4 : q5 <= num;
        3'h5 : q6 <= num;
        3'h6 : q7 <= num;
        3'h7 : q8 <= num;
            
            default: begin
                q1<=q1 ; q2<=q2 ; q3<=q3 ; q4<=q4 ; q5<=q5 ; q6<=q6 ; q7<=q7 ; q8<=q8;
            end
        endcase
    end
    
end

always_comb begin
    case (t_selector)
        3'h0 : q = q1;
        3'h1 : q = q2;
        3'h2 : q = q3;
        3'h3 : q = q4;
        3'h4 : q = q5;
        3'h5 : q = q6;
        3'h6 : q = q7;
        3'h7 : q = q8;
        
        default: begin
            q = 4'b0000;
        end
    endcase
end

always_comb begin
    if (reset) begin
        t_selector[0] = 0;
    end
    else begin
        t_selector[0] =clock;
    end
    
end
always_ff @(posedge clock or posedge reset) begin
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
    case (q)
         4'h0 : led = 7'b0000001;
         4'h1 : led = 7'b1001111;
         4'h2 : led = 7'b0010010;
         4'h3 : led = 7'b0000110;
         4'h4 : led = 7'b1001100;
         4'h5 : led = 7'b0100100;
         4'h6 : led = 7'b0100000;
         4'h7 : led = 7'b0001111;
         4'h8 : led = 7'b0000000;
         4'h9 : led = 7'b0000100;
         4'hA : led = 7'b0001000;
         4'hB : led = 7'b1100000;
         4'hC : led = 7'b0110001;
         4'hD : led = 7'b1000010;
         4'hE : led = 7'b0110000;
         4'hF : led = 7'b0111000;

        default: begin
            led = 7'b1111111;
        end
    endcase
end

always_comb begin
    if (!write) begin
    case (t_selector)
    3'h0 : segment = 8'b11111110;
    3'h1 : segment = 8'b11111101;
    3'h2 : segment = 8'b11111011;
    3'h3 : segment = 8'b11110111;
    3'h4 : segment = 8'b11101111;
    3'h5 : segment = 8'b11011111;
    3'h6 : segment = 8'b10111111;
    3'h7 : segment = 8'b01111111;
        default: begin
            segment = 8'b11111111;
        end
    endcase
    end
    else begin
            segment = 8'b11111111;
        end
    end
    



endmodule 
   







  