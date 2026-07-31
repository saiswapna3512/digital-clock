`timescale 1ns/1ps

module digital_clock_tb;

reg clk;
reg reset;

wire [5:0] sec;
wire [5:0] min;
wire [4:0] hour;

digital_clock uut(
    .clk(clk),
    .reset(reset),
    .sec(sec),
    .min(min),
    .hour(hour)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #700;

    $finish;
end

initial
begin
    $display("---------------------------------------");
    $display("Time(ns)\tHour\tMin\tSec");
    $display("---------------------------------------");

    $monitor("%0t\t\t%d\t%d\t%d",$time,hour,min,sec);
end

endmodule