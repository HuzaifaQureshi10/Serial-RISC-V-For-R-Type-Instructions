module regFile(
    input clk,
    input enrd, //write enable
    input reset,
    input ins,
	 input rd,
    output reg rs1,
    output reg rs2,
	 output reg [31:0] insbuffer, // for testing
    output reg [31:0] rs1buffer,  // for testing
    output reg [31:0] rs2buffer,  //for testing
    output reg [35:0] i,          //for testing
    output reg [31:0] registers[0:31] //for testing
	 
	 
	 
);


integer j;
reg [31:0] registers[0:31];
reg [4:0] rdsel;




always@(posedge clk) begin 

if (reset || i==98) begin
registers[0] <= 5;
registers[1] <=8;
for (j = 2; j < 32; j = j + 1) begin
registers[j] <= 0;
end
rs1buffer <= 0;
rs2buffer <= 0;
insbuffer <= 0;
rdsel <= 0;
i <= 0;
end


else begin


if(enrd) begin //phase 5

registers[rdsel][i-66] = rd;

end


else if(i<32) begin //phase 1
 insbuffer <= insbuffer >> 1; 
 insbuffer[31] <= ins; 
 end
 
else if(i == 32) begin //phase 2
rs1buffer <= registers[insbuffer[19:15]];
rs2buffer <= registers[insbuffer[24:20]];
rdsel <= insbuffer[11:7];
end
 
 
 
 else if(32< i && i <65) begin  //phase 3
	 rs1 <= rs1buffer[i-33];
	 rs2 <= rs2buffer[i-33];
	 end
	 i <= i+1;
    
	 
	 
	 
	 
	 end
	 
	
end



endmodule





































