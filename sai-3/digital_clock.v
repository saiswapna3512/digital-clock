module digital_clock(
    input clk,
    input reset,
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [4:0] hour
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        sec  <= 0;
        min  <= 0;
        hour <= 0;
    end
    else
    begin
        if(sec == 59)
        begin
            sec <= 0;

            if(min == 59)
            begin
                min <= 0;

                if(hour == 23)
                    hour <= 0;
                else
                    hour <= hour + 1;
            end
            else
                min <= min + 1;
        end
        else
            sec <= sec + 1;
    end
end

endmodule