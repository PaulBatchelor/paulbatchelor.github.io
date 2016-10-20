# the minions are coming tho
# Paul Batchelor
# October 20 2016

_clk var

_seq "74 72 70 69 67" gen_vals
_bs "43 41 39 38 43 45 46 48" gen_vals
_nt 55 varset

0.5 10 (1 3 5 randh) randi metro _clk set 

_clk get dup tog _clk get 0.005 0.5 trand 
_clk get -10 5 trand 0 tseg 

74 mtof 0.3 
_clk get 0.5 maytrig dup tog _clk get 0.005 0.5 trand 
_clk get -10 5 trand 0 tseg 0.1 0.5 scale
square

4 metro 0.5 maytrig 0 _seq tseq 
0.01 port mtof 0.4 2 7 5 fm 0 0.8 1 randi cf

700 1000 13 bpm2rate randi butlp

*

1 
(30 50 1 randh metro tog 0.001 port) 
10 metro 0.4 maygate 0.003 port
cf * 

dup 0.9 1.1 delay -6 ampdb *  + -6 ampdb * 

90 bpm2dur dmetro 4 0 tdiv 0.8 maytrig tick + 0 _bs tseq 0.01 port _nt set

_nt get mtof 0.1 saw 
_nt get 12.1 - mtof 0.2 saw 
_nt get 11.9 - mtof 0.1 saw + + 

300 900 0.2 randi butlp +

0.4 noise 15 metro dup 4 0 tdiv 0.2 maygate * 0.9 maytrig 0.0005 tgate 0.001 port *  

+

dup

200 buthp dup 20 10 4000 zrev drop -3 ampdb * +

0.1 0.001 -3 peaklim 3 ampdb * 
