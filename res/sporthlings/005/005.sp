# Midnight Crawl
# Paul Batchelor
# November 2016

_seq "0 2 7" gen_vals 
_prog "0 2 5 7 9" gen_vals
_seq2 "0 2 7 11 14 19" gen_vals
_clk var

_send var 
_env var

125 4 * bpm2dur dmetro 0.8 maytrig _clk set 
_clk get 0 _seq tseq 58 + 
_clk get 4 0 tdiv 0.1 maytrig 1 _prog tseq + 
12 _clk get 0.2 maygate * + 
0.1 0.1 5 jitter + mtof 
0.001 0.02 5 inv randi port 0.4 saw 15 inv 1 sine 200 800 biscale butlp
_clk get 0.05 maytrig  1.4 1.1 2.3 tenv *

_clk get 0.7 maytrig 0.001 0.001 0.001 tenvx 1.9 noise * 
_clk get 100 1000 trand _clk get 0.8 0.9 trand streson 
_clk get 400 4000 trand 0.9 streson 
_clk get 100 1000 trand 0.8 streson  
dcblk -10 ampdb * 2500 butlp 

dup _clk get 4 0 tdiv 0.1 maygate 0.01 port * _send set +

_clk get 16 0 tdiv 0.2 maytrig 

dup 0.005 0.01 0.3 tenvx _env set

1 _seq2 tseq 58 12 + + mtof 13 inv 1 sine 0.01 0.2 biscale 
2 5 _env get 5 * fm _env get * 1500 butlp 

dup 0.3 * 
_send get + _send set 
+

dup 0.9 125 bpm2dur 1.51 * delay 2000 butlp -8 ampdb * + 

_send get dup 0.98 5550 revsc drop 0.9 * dcblk 200 buthp + 
_send get 0.3 125 bpm2dur delay -3 ampdb * +
