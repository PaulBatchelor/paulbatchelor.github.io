# when the wheels could turn
# paul batchelor
# march 2017

_sine 8192 gen_sine
_seq "69 76 74 73" gen_vals 

_pitch var
_amt var
_send var
_prop var
_dry var

69 _pitch set

20 50 1 randh inv 1 0.25 _sine osc 
dup 0 5 biscale _amt set
0 1 biscale _send set

0 _seq tget mtof metro 
0 _seq tget _amt get - mtof 
0 _seq tget _amt get + mtof 
trand 0.3 0 _sine osc 
0 1 1 randi * 

1 _seq tget mtof metro 
1 _seq tget _amt get - mtof 
1 _seq tget _amt get + mtof 
trand 0.3 0.25 _sine osc 
0 1 0.5 randi * +

2 _seq tget mtof metro 
2 _seq tget _amt get - mtof 
2 _seq tget _amt get + mtof 
trand 0.3 0.1 _sine osc 
0 1 0.9 randi * +

3 _seq tget mtof metro 
3 _seq tget _amt get - mtof 
3 _seq tget _amt get + mtof 
trand 0.3 0.1 _sine osc 
0 1 0.2 randi * +

dup _send get * 0.8 0.1 delay 0.1 * 1000 butlp  + 

dup 

-0.001 -0.2 1 randh dup -1 * limit 3.0 0.02 comb 1000 0.8 streson

2.0 * swap _send get cf
-3 ampdb * 

160 
"2(++)4(++-+)4(-++-)2(??)|+{2(?+)|+}+?|2[3(+2(+?)+)]++|-+-4(++++)" 
prop _prop set

_prop get 0.001 0.002 
_prop get 0.004 0.2 trand
tenvx * 

dup 

_prop get 0.2 maygate 0.003 port * 
0.8 160 bpm2dur 0.75 * delay 
10 _send get 1000 4000 scale bitcrush 
-10 ampdb * 

+ 

0 160 4 clock
0.4 maytrig 
0.02 tgate 0.001 port 0.2 noise * 
_prop get 200 1000 trand 0.9 streson 
_prop get 200 1000 trand 0.9 streson 
_prop get 200 1000 trand 0.9 streson dcblk  -8 ampdb * 

dup _prop get 1 _send get - 0.1 0.8 scale maygate 0.1 port * jcrev 2 * 

swap dup _prop get 4 0 tdiv _send get 0.1 0.5 scale maygate 0.001 port * 
_send get 0.1 0.9 scale
160 bpm2dur 0.125 * delay + 

+

+ 
_dry set


_dry get
_dry get 0 _seq tget mtof 0.9 streson 
_dry get 1 _seq tget mtof 0.9 streson  +
_dry get 2 _seq tget mtof 0.99 streson  +
_dry get 3 _seq tget mtof 0.99 streson  + dcblk 
bal

dup dup 0.97 10000 revsc drop 500 buthp 0.05 * dcblk + 

_dry get

20 80 1 randi inv 1 0.75 _sine osc 0 1 biscale  cf

0.003 0.01 -20 peaklim
