# in seven
# paul batchelor
# january 2017 

_seq "0 4 5 7 -2" gen_vals
_clk var 
_dry var 
_send var 

210 "++2(+-+)" prop _clk set

_clk get 0 _seq tseq 58 + mtof 0.001 port  0.3
_clk get 1 3 trand floor 
_clk get 1 7 trand floor
30 inv 1 sine 0.1 2 biscale
fm 

dup _clk get 0.2 maygate 0.01 port * _send set

_clk get 0.001 0.01 0.4 tenv  *

_dry set

_dry get _send get 2 * + dup 0.97 5000 revsc drop -27 ampdb * dcblk

_send get 0.8 210 bpm2dur 1.5 * delay 800 butlp -7 ampdb * + 

_dry get + 
