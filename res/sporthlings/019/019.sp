# do electric dreams sheep of androids?
# paul batchelor
# july 2017

_clk var
_kick var
_snare var
_bass "1 0 0 0 1 0 0 0 1 0 0 1 0 1 0 0" gen_vals
_prog "0 -4 -2 -7" gen_vals
_arp "0 12 24 12" gen_vals
_off var
_delta "0.3 0.2" gen_vals

tick 1 0 0.5504 _delta dtrig _clk set

_clk get 4 0 tdiv _kick set
_kick get 2 1 tdiv _snare set

_kick get 0.001 0.001 0.05 tenvx 
_kick get 0.001 0.001 0.04 tenvx 55 120 scale 0.9 1 4.1514 
_kick get 0.001 0.001 0.01 tenv 0 8 scale fm * 
55 100 3 eqfil 
_kick get 0.01 0.001 0.2 tenv 60 0.5 sine * + 0.9 clip

_clk get 0.001 0.01 
_clk get 0.01 0.02 trand tenvx dup
-0.3 0.3 rot 7000 8000 scale randh swap *
6000 buthp
0.3 *
+

_snare get 0.002 0.002 0.025 tenvx -0.2 0.2 4300 randh * 
900 1000 8.5 eqfil
40 0.01 saturator 0.3 clip 5 ampdb * 
500 3000 butbp
dup jcrev -10 ampdb * + 
+ -3 ampdb *

_kick get 4 0 tdiv 0 _prog tseq 
_clk get 0 _arp tseq _clk get 0.4 maygate * + 
0.005 port
_off set
_clk get dup 0 _bass tseq * 
0.001 0.1 0.1 tenvx 
45 _off get + mtof 0.3 saw  
32.9 _off get + mtof 0.5 saw +
57.1 _off get + mtof 0.3 saw +
*
1000 4000 
_clk get 2 0 tdiv 0.3 maygate 0.01 port cf 0.05 diode
10 0.01 saturator dcblk -8 ampdb * 
+ 
