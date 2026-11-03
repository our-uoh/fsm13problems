`timescale 1ns / 1ps
module tb_traffic_light_controller;
    reg clk, reset, C, TL, TS;
    wire [1:0] hw_light, fm_light;
    traffic_light_controller uut (
        .clk(clk), .reset(reset), .C(C), .TL(TL), .TS(TS),
        .hw_light(hw_light), .fm_light(fm_light)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; C = 0; TL = 0; TS = 0;
        #12 reset = 0;
        TL = 1; C = 0; #10;
        C = 1; #10;
        TL = 0; #10;
        TS = 1; #10;
        TS = 0; #10;
        TL = 1; #10;
        TL = 0; #10;
        TS = 1; #10;
        TS = 0; C = 0; #20;

        $finish;
    end
    endmodule
