`timescale 1ns / 1ps

module button_signal(
input wire clk,rst,guess_mode,
input wire [1:0]input_sig,
output reg [2:0]button_cnt_p1,button_cnt_p2,
                button_press_cnt_p1,button_press_cnt_p2,
output wire button_released_p1,button_released_p2,
                 button_pressed_p1,button_pressed_p2
    );
     
    
    reg button_d_1,button_s_1,button_d_2,button_s_2;
    
  


    assign button_released_p1 = (~button_d_1) &&( button_s_1) ;
    assign button_released_p2 = (~button_d_2) && (button_s_2) ;
    assign button_pressed_p1 = (button_d_1) &&~( button_s_1) ;
    assign button_pressed_p2 = (button_d_2) && ~(button_s_2) ;

always@(posedge clk, posedge rst )
    if(rst) begin
        button_d_1 <= 1'b0;
        button_d_2 <= 1'b0;
        button_s_1 <= 1'b0;
        button_s_2 <= 1'b0;
       end
    else  begin
        button_d_1 <=  (input_sig == 2'b01) && guess_mode ;
        button_d_2 <=  (input_sig == 2'b10) && guess_mode ;
        button_s_1 <= button_d_1;
        button_s_2 <= button_d_2;
        end

always@(posedge clk, posedge rst)   //추측하기 버튼이 눌린 횟수
    if(rst) 
        button_cnt_p1 = 0;
       
    else if((~button_d_1) &&( button_s_1)) begin 
        button_cnt_p1 = button_cnt_p1 + 1;
    end 
    
 always@(posedge clk, posedge rst)   //추측하기 버튼이 눌린 횟수
    if(rst) 
        button_cnt_p2 = 0; 
    else if((~button_d_2) && (button_s_2))
        button_cnt_p2 = button_cnt_p2+1 ;
        
 always@(posedge clk, posedge rst)   //추측하기 버튼이 눌린 횟수
    if(rst) 
        button_press_cnt_p1 = 0; 
    else if((button_d_1) &&~( button_s_1)) 
        button_press_cnt_p1 = button_press_cnt_p1 + 1;
     
 always@(posedge clk, posedge rst)   //추측하기 버튼이 눌린 횟수
    if(rst) 
        button_press_cnt_p2 = 0; 
    else if((button_d_2) && ~(button_s_2)) 
        button_press_cnt_p2 = button_press_cnt_p2+1 ;
               

endmodule
