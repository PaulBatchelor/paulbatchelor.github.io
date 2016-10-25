# Machines at Work
# Paul Batchelor
# October 24 2016

_sine 8192 "1 0 0.1 0.8 0.8" gen_sinesum
_seq 32 "38 0.7 41 0.2 43 0.1" gen_rand
_sqrseq "74 77 79 81" gen_vals

_clk var
92 4 * bpm2dur dmetro _clk set

_note 38 varset

_rms var
_bass var

_clk get 2 0 tdiv 1 _seq tseq 0.001 port _note set

_note get mtof 0.1 2 1 (0.1 1 sine 1 3 biscale) _sine fosc
_note get 12.1 - mtof 0.1 1 1 (0.1 1 sine 4 7 biscale) _sine fosc +
_note get 7 + mtof 0.2 tri +
_clk get 2 0 tdiv 0.001 0.01 0.3 tenvx dup _rms set * 

3000 butlp
_bass set

_clk get dup 0.001 0.02 0.1 tenvx swap 0 _sqrseq tseq 
_clk get 0.2 maygate 12 * +

0.005 port mtof

0.3 10 inv 1 sine 0.2 0.8 biscale square *  
2000 butlp

dup 0.7 92 bpm2dur 0.75 * delay 1000 butlp -4 ampdb * + 

76 mtof 0 0.2 0.2 randi saw 
65 mtof 0 0.2 0.5 randi saw +
67 mtof 0 0.2 1 randi saw +
12 inv 1 sine 1000 3000 biscale 0.5 moogladder 2 *  
dup 0.7 92 bpm2dur delay 1000 buthp -3 ampdb * + +

92 "-+|-2(-+)|-4(++--)|-?-4(-+-+)" prop 0.7 maytrig
0.001 0.1 0.1 tenvx (-0.3 0.3 sr (1 5 13 randh) / randh) * 4000 butlp

10 40 1 randh metro 0.001 0.015 2 randi tgate 1 _clk get 0.5 maytrig 
tog 0.01 port cf *

dup 0.7 92 bpm2dur 0.75 * delay -10 ampdb * + 

+

1 _rms get - -3 2 scale ampdb * 500 buthp
dup jcrev 3 ampdb * +

_bass get  100 100 3 eqfil + 

-2 ampdb * 
