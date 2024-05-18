module serialRtype(
input clk,
input reset
);
wire wenl,wins,wrden,waluout,waluin1,waluin2;
wire [31:0] wcount;
wire [3:0] walucont;

pc pc1(.clk(clk),.reset(reset),.count(wcount));

programMem mem1(.address(wcount),.clk(clk),.reset(reset),.ins(wins));

controlUnit cu1(.clk(clk),.reset(reset),.ins(wins),.aluCont(walucont),.rdEn(wrden));

regFile rf1(.clk(clk),.reset(reset),.ins(wins),.enrd(wrden),.rd(waluout),
.rs1(waluin1),.rs2(waluin2));

alu alu1(.clk(clk),.reset(reset),.A1(waluin1),.A2(waluin2),.aluOut(waluout));

endmodule 