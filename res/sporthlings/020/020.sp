# dependence day
# paul batchelor
# july 2017

_dry var
_base var
_buf sr 4 * zeros
62 mtof _base set
_amps '1 0.9 0.0 0.3 0.1' gen_vals

_seq '64 66 69 71 68' gen_vals

_padsynth 262144 _base get 50 _amps gen_padsynth

62 mtof _base get / 0.3 0 _padsynth osc 
10 inv 1 sine 0 1 biscale *
64 mtof _base get / 0.3 0.1 _padsynth osc +
8 inv 1 sine 0 1 biscale *

68 mtof _base get / 0.3 0.2 _padsynth osc 
69 mtof _base get / 0.3 0.2 _padsynth osc 
7 dmetro 0.9 maytrig tog 0.5 port cf 
+

4 inv 1 sine 9 12 biscale inv 1 sine 0 1 biscale *
76 mtof _base get / 0.3 0.9 _padsynth osc +
38 mtof 0.3 1 1 4 fm + 
26 mtof 0.5 1 1 4 fm + 
11.5 inv 1 sine 0 1 biscale *

-6 ampdb *

7 inv 1 sine 1 10 biscale metro 0.5 maytrig 
0.001 0.001 0.001 tenvx 0.2 noise 
* 
500 800 2 randi 0.9 streson
100 300 1 randi 0.9 streson 
100 1000 1.5 randi 0.9 streson 
dcblk
_tk var
tick _tk set
_tk get _buf tblrec drop
0 _buf tbldur 1 5 3 randh randi 0.9 1.3 64 _buf mincer 1000 buthp
1 metro 0.5 maytrig tog 0.1 port * 
3.5 0.05 allpass
6.5 0.01 allpass

+

_pch var
_hi var
59 
"6[+2(+2(+?))]|2[+?+2[+?]--]" 
prop dup dup _tk set 0.005 0.01 0.9 tenvx swap 0 _seq tseq 
_tk get 0.4 maygate 12 * + 
dup _pch set
0.002 port
0.1 0.5 3 jitter + 
_tk get 4 7 trand _tk get 0.01 0.2 trand sine  + 
mtof 0.3 2 1 _tk get 0 2 trand fm 


* 
_tk get _pch get mtof 0.1 70 pluck 
_tk get _pch get 0.03 + mtof 0.1 50 pluck dup _hi set +
_tk get _pch get 0.1 - mtof 0.1 70 pluck +
+ 

dup 0.9 1.75 delay 1000 butlp 13 inv 1 sine -20 -10 biscale
ampdb * + 

+ 

_dry set

_dry get 500 buthp _hi get + 
dup 15 inv 1 sine 0.9 0.98 biscale 10000 revsc + -14 ampdb * dcblk _dry get + 
