`timescale 1ns/1ps
module digilock (
    input clk,
    input reset,
    input enter,
    input [3:0] password,
    output reg unlock,
    output reg wrong_password
);

    // Correct password = 1011

    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            unlock <= 1'b0;
            wrong_password <= 1'b0;
        end

        else if (enter)
        begin
            if (password == 4'b1011)
            begin
                unlock <= 1'b1;
                wrong_password <= 1'b0;
            end

            else
            begin
                unlock <= 1'b0;
                wrong_password <= 1'b1;
            end
        end
    end

endmodule
