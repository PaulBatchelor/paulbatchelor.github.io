# Congested Dragon
# Paul Batchelor
# June 2017
1024 _frames lpcsynth
_clk var

1 metro 0.5 maytrig 0.01 0.1 0.3 tenv 1 swap - 0.0 0.9 biscale 0 _frames tset
0.1 dmetro 0.3 maygate 1 _frames tset
1 1 sine 0.1 0.9 biscale 2 _frames tset
1.0 3 _frames tset
1.0 4 _frames tset
2.5 dmetro 0.5 maygate 0.3 * 5 _frames tset
0.0 6 _frames tset


dup 0.1 1 1 sine 0.001 0.02 biscale 0.1 vdelay + 
-10 ampdb * 

3 metro 0.2 maytrig _clk set 
_clk get 0.9 tgate 0.001 port -0.4 0.4 
_clk get 0.9 0.01 0.9 tenv 50 8000 scale randh * 1000 butlp 300 buthp +

dup dup 20 20 10000 zrev drop -25 ampdb * +
