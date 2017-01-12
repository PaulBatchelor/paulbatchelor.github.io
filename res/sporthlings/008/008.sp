(
# the waiting room
# paul batchelor
# january 2017

_sine 8192 gen_sine

_seq "62 69 72 71 74" gen_vals

62 mtof 0.3 8 3 
15 inv 1 0.2 _sine osc
0.1 0.6 biscale gbuzz

60 mtof 0.3 8 3 
10 inv 1 0 _sine osc
0.1 0.6 biscale gbuzz 

+

69 mtof 0.3 8 3 
12 inv 1 0.75 _sine osc
0.1 0.6 biscale gbuzz

+

-8 ampdb * 400 buthp

0 77 1 clock 0.4 maytrig dup
1 _seq tseq mtof 0.003 port 0.5 50 pluck 3000 butlp 
66 mtof 0.91 streson dcblk
dup 0.4 
0.1 1 0 _sine osc 0.002 0.008 biscale 0.2 vdelay + dcblk

dup 0.7 77 bpm2dur 0.75 * delay 2000 butlp 0.5 * + 

-3 ampdb * 

+

26 mtof 0.2 saw 
38.1 mtof 0.3 saw +
8 inv 1 0 _sine osc 500 2000 biscale 0.1 diode 

+

-3 ampdb *
)
