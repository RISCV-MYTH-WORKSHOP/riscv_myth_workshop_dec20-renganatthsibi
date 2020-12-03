\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
\TLV
   $reset = *reset;

   $val1[31:0] = $rand1[3:0];
   $val2[31:0] = $rand2[3:0];
   
   $sum[31:0] = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;

   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   
   $out[31:0] = ($op[1] == 1) ? (($op[0] == 1) ? $quot : $prod) : (($op[0] == 1) ? $diff : $sum);
   
   
   

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
