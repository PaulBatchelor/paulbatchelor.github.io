# rusty spoon
# paul batchelor
# feb 2017

_buf 4 sr * zeros
_clk var
_bpm var
_tk var

tick _tk set

3 dmetro 50 220 trand "bpm" print _tk get 1.9 tport _bpm set

0 _bpm get 2 clock _clk set

_clk get 
0.1 1.0 1 randi 
maytrig 440 0.99 streson

_tk get _buf tblrec

0 1 
10 inv 1 sine 0.1 3 biscale
randi 1 0 0 _buf tabread
10 5000 bitcrush

_clk get 2 0 tdiv 0.6 maytrig _bpm get 2 16 5 randi 8 1 rpt

100 0.9 streson
440 0.9 streson
800 0.6 streson
500 buthp
dup jcrev + 

dup 0.9 0.9 (0.1 0.01 1 jitter) + 2.0 vdelay 1000 butlp -10 ampdb * + 
