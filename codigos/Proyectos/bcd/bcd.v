module bcd_counter(
    input clk,
    input reset,
    output [6:0] seg
);

wire clk_div;
wire [3:0] bcd_out;

div_freq div_freq_inst(
    .clk_in(clk),
    .clk_out(clk_div)
);

bcd_counter_logic bcd_counter_logic_inst(
    .clk(clk_div),
    .reset(reset),
    .bcd_out(bcd_out)
);

BCD7Seg BCD7Seg_inst(
    .bcd(bcd_out),
    .seg(seg)
);

endmodule

module div_freq(
    input clk_in,
    output reg clk_out
);

parameter DIVISOR = 10000000;
reg [31:0] contador;

always @(posedge clk_in) begin
    if (contador == DIVISOR - 1) begin
        contador <= 0;
        clk_out <= ~clk_out;
    end else begin
        contador <= contador + 1;
    end
end

endmodule

module bcd_counter_logic(
    input clk,
    input reset,
    output reg [3:0] bcd_out
);

// Definición de los estados
parameter STATE_0 = 4'b0000,
          STATE_1 = 4'b0001,
          STATE_2 = 4'b0010,
          STATE_3 = 4'b0011,
          STATE_4 = 4'b0100,
          STATE_5 = 4'b0101,
          STATE_6 = 4'b0110,
          STATE_7 = 4'b0111,
          STATE_8 = 4'b1000,
          STATE_9 = 4'b1001;

reg [3:0] current_state, next_state;

// Lógica de transición de estados
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= STATE_0;
    end else begin
        current_state <= next_state;
    end
end

// Lógica de próximo estado y salida
always @(current_state) begin
    case (current_state)
        STATE_0: begin
            bcd_out = 4'b0000;
            next_state = STATE_1;
        end
        STATE_1: begin
            bcd_out = 4'b0001;
            next_state = STATE_2;
        end
        STATE_2: begin
            bcd_out = 4'b0010;
            next_state = STATE_3;
        end
        STATE_3: begin
            bcd_out = 4'b0011;
            next_state = STATE_4;
        end
        STATE_4: begin
            bcd_out = 4'b0100;
            next_state = STATE_5;
        end
        STATE_5: begin
            bcd_out = 4'b0101;
            next_state = STATE_6;
        end
        STATE_6: begin
            bcd_out = 4'b0110;
            next_state = STATE_7;
        end
        STATE_7: begin
            bcd_out = 4'b0111;
            next_state = STATE_8;
        end
        STATE_8: begin
            bcd_out = 4'b1000;
            next_state = STATE_9;
        end
        STATE_9: begin
            bcd_out = 4'b1001;
            next_state = STATE_0;
        end
        default: begin
            bcd_out = 4'b0000;
            next_state = STATE_0;
        end
    endcase
end


endmodule

module BCD7Seg(
    input wire [3:0] bcd,
    output reg [6:0] seg
);

always @(*) begin
    case (bcd)
        4'b0000: seg = 7'b1000000;
        4'b0001: seg = 7'b1111001;
        4'b0010: seg = 7'b0100100;
        4'b0011: seg = 7'b0110000;
        4'b0100: seg = 7'b0011001;
        4'b0101: seg = 7'b0010010;
        4'b0110: seg = 7'b0000010;
        4'b0111: seg = 7'b1111000;
        4'b1000: seg = 7'b0000000;
        4'b1001: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end

endmodule