module programMem(
    input wire[31:0] address,
	 input clk,
	 input reset,
    output reg ins,
	 output reg [35:0] i,
	 output reg [31:0] insbuffer
);

reg[7:0] ROM[0:47];



always @(*) begin   //little endian
    ROM[0] = 8'b00101111; //lsb          //h93
    ROM[1] = 8'b00110101;                //h02
    ROM[2] = 8'b00111010;                //h00
    ROM[3] = 8'b11111110; //msb1         //h00
    ROM[4] = 8'b00011101;//lsb     //h13
    ROM[5] = 8'b01010101;   		  //h03    
    ROM[6] = 8'b11111110;          //h00
    ROM[7] = 8'b11001100; //msb2   //h00
    ROM[8] = 8'h93;//lsb  
    ROM[9] = 8'h03; 
    ROM[10] = 8'h10; 
    ROM[11] = 8'h00;//msb3 
    ROM[12] = 8'h13;//lsb 
    ROM[13] = 8'h0E; 
    ROM[14] = 8'hE0;  
    ROM[15] = 8'h00;//msb4
    ROM[16] = 8'h93; //lsb
    ROM[17] = 8'h0F; 
    ROM[18] = 8'h00;  
    ROM[19] = 8'h00; //msb5
    ROM[20] = 8'h93;  //lsb
    ROM[21] = 8'h0E; 
    ROM[22] = 8'h03; 
    ROM[23] = 8'h00; //msb6
    ROM[24] = 8'h33;  //lsb
    ROM[25] = 8'h03; 
    ROM[26] = 8'h73; 
    ROM[27] = 8'h00; //msb7
    ROM[28] = 8'h93; //lsb
    ROM[29] = 8'h83; 
    ROM[30] = 8'h0E; 
    ROM[31] = 8'h00; //msb8
    ROM[32] = 8'h93; //LSB
    ROM[33] = 8'h0F; 
    ROM[34] = 8'h03; 
    ROM[35] = 8'h00; //MSB9
    ROM[36] = 8'h93; //LSB
    ROM[37] = 8'h82; 
    ROM[38] = 8'h12;  
    ROM[39] = 8'h00; //MSB10
    ROM[40] = 8'hE3; //LSB
    ROM[41] = 8'hC6; 
    ROM[42] = 8'hC2; 
    ROM[43] = 8'hFF; //MSB10
    ROM[44] = 8'h6F; //LSB
    ROM[45] = 8'hF0; 
    ROM[46] = 8'h5F; 
    ROM[47] = 8'hFD; //MSB11

    insbuffer = {ROM[address +3], ROM[address + 2], ROM[address + 1], ROM[address]};
   
	 
	 end

always@(posedge clk) begin 

if (reset || i ==98) begin 
 i <= 0;
 ins <= 0;
 end
 
 else begin 
 
 
if (i<32) ins <= insbuffer[i]; //phase 1

i <= i +1;





end


end

endmodule
/* Purely combination continous circuit with hardcoded program.
Since its byte accessible, the address always corresponds to the location of the least
significant byte , hence the insturction (32bit) contains the least significant byte (present 
at the address location) and the next 3 bytes. */


/* 
correction: ROM stores instructions in reverse. Least significant byte is stored
at the first byte location and the upper 3 then follow. 
*/


