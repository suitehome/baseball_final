`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/13 11:59:13
// Design Name: 
// Module Name: guess
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module guess(
input wire clk,rst,on_game,
input wire button_pressed_p1, button_pressed_p2,
input wire [7:0] ascii_char,
input wire [1:0] strike1, strike2, ball1, ball2,
input wire [11:0]input_number,
output reg [3:0] output_number,
output wire [1:0] strike_player
    );
    reg [11:0]guess_p1_array0,guess_p1_array1,guess_p1_array2,guess_p1_array3;
    reg [11:0]guess_p2_array0,guess_p2_array1,guess_p2_array2,guess_p2_array3 ; 
    reg [1:0] strike_p1_0, strike_p1_1, strike_p1_2, strike_p1_3;
    reg [1:0] ball_p1_0, ball_p1_1, ball_p1_2, ball_p1_3;
    reg [1:0] strike_p2_0,strike_p2_1,strike_p2_2,strike_p2_3;
    reg [1:0] ball_p2_0,ball_p2_1,ball_p2_2,ball_p2_3;
    
    
    
    assign  strike_player  = (strike_p1_0==3)||(strike_p1_1==3)||(strike_p1_2==3)||(strike_p1_3==3)? 'd1:
((strike_p2_0==3)||(strike_p2_1==3)||(strike_p2_2==3)||(strike_p2_3==3))? 'd2 : 0;
           always@(posedge clk,posedge rst) //계속 latch is generated but i exchanged this with clk and it was removed 
                if(rst) begin 
                     guess_p1_array0 <= 0;
                     strike_p1_0 <= 0;
                     ball_p1_0<=0;
                     
                     guess_p1_array1 <= 0;
                     strike_p1_1 <= 0;
                     ball_p1_1<=0;
                     
                     guess_p1_array2 <= 0;
                     strike_p1_2 <= 0;
                     ball_p1_2<=0;
                     
                     guess_p1_array3 <= 0;
                     strike_p1_3 <= 0;
                     ball_p1_3<=0;
                     end 
                else if(button_pressed_p1&&on_game) begin 
                     guess_p1_array0 <= input_number;
                     strike_p1_0 <= strike1;
                     ball_p1_0 <= ball1;
                     
                     guess_p1_array1 <= guess_p1_array0;
                     strike_p1_1 <= strike_p1_0;
                     ball_p1_1 <= ball_p1_0;
                     
                     guess_p1_array2 <= guess_p1_array1;
                     strike_p1_2 <= strike_p1_1;
                     ball_p1_2 <= ball_p1_1;
                     
                     guess_p1_array3 <= guess_p1_array2;
                     strike_p1_3 <= strike_p1_2;
                     ball_p1_3 <= ball_p1_2;
      
                           end      
           always@(posedge clk,posedge rst) //계속 latch is generated but i exchanged this with clk and it was removed 
                if(rst) begin 
                     guess_p2_array0 <= 0;
                     strike_p2_0 <= 0;
                     ball_p2_0<=0;
                     
                     guess_p2_array1 <= 0;
                     strike_p2_1 <= 0;
                     ball_p2_1<=0;
                     
                     guess_p2_array2 <= 0;
                     strike_p2_2 <= 0;
                     ball_p2_2<=0;
                     
                     guess_p2_array3 <= 0;
                     strike_p2_3 <= 0;
                     ball_p2_3<=0;
                     end 
                else if(button_pressed_p2&&on_game) begin 
                     guess_p2_array0 <= input_number;
                     strike_p2_0 <= strike2;
                     ball_p2_0 <= ball2;
                     
                     guess_p2_array1 <= guess_p2_array0;
                     strike_p2_1 <= strike_p2_0;
                     ball_p2_1 <= ball_p2_0;
                     
                     guess_p2_array2 <= guess_p2_array1;
                     strike_p2_2 <= strike_p2_1;
                     ball_p2_2 <= ball_p2_1;
                     
                     guess_p2_array3 <= guess_p2_array2;
                     strike_p2_3 <= strike_p2_2;
                     ball_p2_3 <= ball_p2_2;
  
                           end      
               
               
            
            
       always@*
            case(ascii_char)
                'h20: output_number = guess_p1_array0[11:8];    //number p1
                'h21: output_number = guess_p1_array0[7:4];
                'h22: output_number = guess_p1_array0[3:0];
                 
                'h24: output_number = {2'b00,ball_p1_0};                             //ball and strike 
                'h26: output_number = {2'b00,strike_p1_0};
                
                'h37: output_number = guess_p2_array0[11:8];        //number p2
                'h38: output_number = guess_p2_array0[7:4];
                'h39: output_number = guess_p2_array0[3:0];
                
                'h3b: output_number = {2'b00,ball_p2_0};                             //ball and strike 
                'h3d: output_number = {2'b00,strike_p2_0};
                
                'h40: output_number = guess_p1_array1[11:8];
                'h41: output_number = guess_p1_array1[7:4];
                'h42: output_number = guess_p1_array1[3:0];
                 
                'h44: output_number = {2'b00,ball_p1_1};
                'h46: output_number = {2'b00,strike_p1_1};
                
                'h57: output_number = guess_p2_array1[11:8];
                'h58: output_number = guess_p2_array1[7:4];
                'h59: output_number = guess_p2_array1[3:0];
                
                'h5b: output_number = {2'b00,ball_p2_1};                             //ball and strike 
                'h5d: output_number = {2'b00,strike_p2_1};
                
                'h60: output_number = guess_p1_array2[11:8];
                'h61: output_number = guess_p1_array2[7:4];
                'h62: output_number = guess_p1_array2[3:0];
                 
                'h64: output_number = {2'b00,ball_p1_2};
                'h66: output_number = {2'b00,strike_p1_2};
                
                'h77: output_number = guess_p2_array2[11:8];
                'h78: output_number = guess_p2_array2[7:4];
                'h79: output_number = guess_p2_array2[3:0];
                
                'h7b: output_number = {2'b00,ball_p2_2};                             //ball and strike 
                'h7d: output_number = {2'b00,strike_p2_2};
                
                'h80: output_number = guess_p1_array3[11:8];
                'h81: output_number = guess_p1_array3[7:4];
                'h82: output_number = guess_p1_array3[3:0];
                 
                'h84: output_number = {2'b00,ball_p1_3};
                'h86: output_number = {2'b00,strike_p1_3};
                
                'h97: output_number = guess_p2_array3[11:8];
                'h98: output_number = guess_p2_array3[7:4];
                'h99: output_number = guess_p2_array3[3:0];
                
                'h9b: output_number = {2'b00,ball_p2_3};                             //ball and strike 
                'h9d: output_number = {2'b00,strike_p2_3};
                default:  output_number = 4'b0000;
             endcase
               
      
             
             
endmodule
