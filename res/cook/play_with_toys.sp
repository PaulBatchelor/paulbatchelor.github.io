_seq 32 "0 0.4 7 0.4 12 0.1 5 0.1" gen_rand
_clk var 
_trig var
_freq var
_dry var
_bpm 110 varset
0 _bpm get 4 clock _clk set
_clk get 0.6 maytrig _trig set
_trig get 1 _seq tseq 60 + _freq set
_freq get mtof 0.1 
_trig get 0 3 trand floor
_trig get 0 7 trand  floor
1 fm
_trig get 0.005 0.01 0.04 tenvx * 
_freq get 12 - mtof 0.1 saw 1000 0.1 moogladder
_trig get 0.3 maytrig 0.01 0.01 0.1 tenvx * 
+ _dry set
_dry get dup 10 10 10000 zrev drop -10 ampdb * 
1000 buthp 
_dry get +
