_clk var
0 150 4 clock _clk set
_clk get 16 "bab|a:bba|b:a" lsys 10.5 2 thresh
0.001 0.001 0.001 tenvx 
30 inv 1 sine 2000 3000 biscale 0.5 sine *
_clk get 17 "bab|a:ba|b:a" lsys 10.5 2 thresh
0.001 0.001 0.001 tenvx 
800 0.5 sine * +
dup 0.8 0.2 delay 4000 buthp -20 ampdb * + 
-0.1 0.1 (40 inv 1 sine 100 110 biscale) randh 
400 butlp 8 8000 bitcrush + 
