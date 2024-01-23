\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/risc-v_shell.tlv
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/risc-v_shell_lib.tlv'])



   //---------------------------------------------------------------------------------
   // /====================\
   // | Sum 1 to 9 Program |
   // \====================/
   //
   // Program to test RV32I
   // Add 1,2,3,...,9 (in that order).
   //
   // Regs:
   //  x12 (a2): 10
   //  x13 (a3): 1..10
   //  x14 (a4): Sum
   // 
   m4_test_prog()
   //---------------------------------------------------------------------------------



\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   /* verilator lint_on WIDTH */
\TLV
   
   $reset = *reset;
   $pc[31:0] =  >>1$next_pc[31:0]+4;
   $next_pc[31:0] = $reset ? 1'b0: $pc[31:0];
   
   `READONLY_MEM($pc, $$instr[31:0]);
   $is_u_instr = $instr[6:2] == 5'b00101 ||
                 $instr[6:2] == 5'b01101;
   $is_i_instr = $instr[6:2] == 5'b00000 ||
                 $instr[6:2] == 5'b00001 ||
                 $instr[6:2] == 5'b00100 ||
                 $instr[6:2] == 5'b00110 ||
                 $instr[6:2] == 5'b11001;
   $is_r_instr = $instr[6:2] == 5'b01011 ||
                 $instr[6:2] == 5'b01100 ||
                 $instr[6:2] == 5'b01110 ||
                 $instr[6:2] == 5'b10100;
   $is_s_instr = $instr[6:2] == 5'b01000 ||
                 $instr[6:2] == 5'b01001;
   $is_b_instr = $instr[6:2] == 5'b11000;
   $is_j_instr = $instr[6:2] == 5'b11011;
   
   $rs2[4:0] = $instr[24:20];
   $funct3[2:0] = $instr[14:12];
   $rs1[4:0] = $instr[19:15];   
   $rd[4:0] = $instr[11:7];
   $opcode[6:0] = $instr[6:0];
   
   $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr; 
   $funct3_valid = $is_r_instr || $is_s_instr || $is_b_instr || $is_i_instr; 
   $rs1_valid = $is_r_instr || $is_s_instr || $is_b_instr || $is_i_instr; 
   $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr; 
   //$rs1_valid = $is_r_instr || $is_s_instr || $is_b_instr || $is_i_instr; 
   $imm_valid = $is_i_instr || $is_s_instr || $is_b_instr || $is_u_instr || $is_j_instr; 
   
   `BOGUS_USE($rs2_valid $funct3_valid $rs1_valid $rd_valid $imm_valid $funct3 $rs1 $rs2 $rd)
   
   $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
                $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
                $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8],1'b0} :
                $is_u_instr ? {$instr[31:12], 12'h000} :
                $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} : 32'h0 ;
                              
   $dec_bits[10:0] = {$instr[30],$funct3,$opcode};
   
   $is_beq = $dec_bits ==? 11'bx_000_1100011;
   $is_bne = $dec_bits ==? 11'bx_001_1100011;
   $is_blt = $dec_bits ==? 11'bx_100_1100011;
   $is_bge = $dec_bits ==? 11'bx_101_1100011;
   $is_bltu = $dec_bits ==? 11'bx_110_1100011;
   $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
   
   $is_addi = $dec_bits ==? 11'bx_000_0010011;
   $is_add = $dec_bits ==? 11'bx_000_0110011;
   
   // Assert these to end simulation (before Makerchip cycle limit).
   //m4+tb()
   *failed = *cyc_cnt > M4_MAX_CYC;
   
   $result[31:0] = $is_addi ? $src1_value + $imm :
                   $is_add ? $src1_value + $src2_value :
               32'b0;
   
   //$taken_br = $src1value == $src2value? 
   m4+rf(32, 32, $reset, $rd_en, $rd[4:0], $result, $rs1_en, $rs1[4:0], $src1_value, $rs2_en, $rs2[4:0], $src2_value)
   //m4+dmem(32, 32, $reset, $addr[4:0], $wr_en, $wr_data[31:0], $rd_en, $rd_data)
   
   m4+cpu_viz()
\SV
   endmodule