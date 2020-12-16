\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV

   |calc
      @1
         $reset = *reset;
         $val1[31:0] = $reset ? 0 : >>2$out[31:0];
         $val2[31:0] = $rand2[3:0];
         $op[2:0] = $reset ? 0 : $rand1[2:0];
         $cnt = $reset ? 0 : >>1$cnt + 1'b1;
         $reset_or_valid = $reset | $cnt;
      ?$reset_or_valid
         @1
            $sum[31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
         @2
            $out[31:0] = $reset ? 0 : ($op == 4) ? >>2$mem[31:0] : ($op == 3) ? $quot : ($op == 2) ? $prod : ($op == 1) ? $diff : ($op == 0) ? $sum : >>2$out;
            $mem[31:0] = $reset ? 0 : ($op == 5) ? >>2$out : >>2$mem;
         

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
