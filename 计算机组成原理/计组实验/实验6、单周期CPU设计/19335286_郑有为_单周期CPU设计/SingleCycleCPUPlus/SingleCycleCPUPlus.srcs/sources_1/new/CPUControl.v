`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 22:09:08
// Design Name: 
// Module Name: CPUControl
//////////////////////////////////////////////////////////////////////////////////


module CPUControl(
    input [31:0] Instruction,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg MemWrite,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg RegWrite,
    output reg JR,
    output reg JAL,
    output reg BranchNot
    );
    
    wire [5:0] OP = Instruction[31:26];
    wire [5:0] Funct = Instruction[5:0];
    //?洢??????ָ?lw sw 
    //?????߼?????ָ?add sub addi
    //??ָ֧?beq j

    always @ (OP)
    begin
        if(OP == 6'b100011) //LW
            begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 0; 
                    MemRead = 1;
                    MemToReg = 1;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 1;
                    RegWrite = 1;
                    JR = 0;
                    JAL = 0;
                    BranchNot = 0; 
            end
        else if(OP == 6'b101011) //SW
            begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 1;
                    ALUSrc1 = 0;
                    ALUSrc2 = 1;
                    RegWrite = 0; 
                    JR = 0; 
                    JAL = 0;  
                    BranchNot = 0; 
            end
        else if(OP == 6'b000000 && Funct == 6'b100000) //ADD
            begin
                    RegDst = 1;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 1;   
                    JR = 0;   
                    JAL = 0;  
                    BranchNot = 0;                                 
            end 
        else if(OP == 6'b000000 && Funct == 6'b100010) //SUB
            begin
                    RegDst = 1;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 1;   
                    JR = 0;   
                    JAL = 0;  
                    BranchNot = 0;                                 
            end
        else if(OP == 6'b000000 && Funct == 6'b101010) //SLT
            begin
                    RegDst = 1;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 1;   
                    JR = 0;   
                    JAL = 0;    
                    BranchNot = 0;                               
            end  
        else if(OP == 6'b000000 && Funct == 6'b000000) //SLL
            begin
                    RegDst = 1;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 1;
                    ALUSrc2 = 0;
                    RegWrite = 1;   
                    JR = 0;   
                    JAL = 0; 
                    BranchNot = 0;                                  
            end 
        else if(OP == 6'b001000 || OP == 6'b001010) //ADDI SLTI
            begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 1;
                    RegWrite = 1;  
                    JR = 0;   
                    JAL = 0; 
                    BranchNot = 0;                      
            end
        else if(OP == 6'b000100) //BEQ
            begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 1;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 0; 
                    JR = 0;     
                    JAL = 0;    
                    BranchNot = 0;                   
            end
        else if(OP == 6'b000010) //J
            begin
                    RegDst = 0;
                    Jump = 1;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 0;  
                    JR = 0; 
                    JAL = 0;    
                    BranchNot = 0;                             
            end

            else if(OP == 6'b000011) //JAL
            begin
                    RegDst = 0;
                    Jump = 1;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 0;
                    JR = 0;     
                    JAL = 1;
                    BranchNot = 0;                               
            end
            else if(OP == 6'b000000 && Funct == 6'b001000) //JR
                begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 0; 
                    JR = 1; 
                    JAL = 0;
                    BranchNot = 0;                                  
                end
            else if(OP == 6'b000101) //BNE
                begin
                    RegDst = 0;
                    Jump = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemWrite = 0;
                    ALUSrc1 = 0;
                    ALUSrc2 = 0;
                    RegWrite = 0; 
                    JR = 0;     
                    JAL = 0;
                    BranchNot = 1;                      
                end
    end
endmodule
