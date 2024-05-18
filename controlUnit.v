module controlUnit(
    input ins,
    input wire brnch,
    input clk,
	 input reset,
	 output reg [35:0] i,        //Just for testing
	 output reg [31:0]insbuffer,  //Just for testing
    output reg [3:0]aluCont, //4 bits
    output reg rdEn,
    output reg DMwriteEn,
    output reg pcloadEn,
    output reg [1:0] rdmuxSel,  //2 bits
    output reg alumux1sel,
    output reg alumux2sel,
    output reg [2:0]imm   //3 bits
    );
	 



always@(posedge clk) begin 

if (reset || i==98) begin
i <= 0;
insbuffer <= 0;
end

else begin

if(i<32) begin //phase 1
 insbuffer <= insbuffer >> 1; 
 insbuffer[31] <= ins; 
 end
 
else if(i == 65 ) begin // phase 4
aluCont <= {insbuffer[30], insbuffer[14:12]};
end


else if(66<i && i<97) begin //phase 5
rdEn <= 1;
end

	 i <= i+1;
end

end
	 
	 	 


endmodule

