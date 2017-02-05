# Bones
# By Paul Batchelor
# September 2016
_rat "1 2.5752 4.4644 6.984" gen_vals
_tk var
_frq var
1 10 1 randh metro
(0.1 0.8 (1 10 3 randh) randi) maytrig 
dup 0.65 maygate * 
tick + 
_tk set
_tk get 500 1500 trand _frq set
_tk get (_frq get 0 _rat tget *) 10 40 3 randi mode
(_frq get 1 _rat tget *) 20 mode
_tk get (_frq get 2 _rat tget *) 22 mode
(_frq get 3 _rat tget *) 15 mode +
dup 0.1 0.8 3 randi
0.001 0.2 (0.1 4 1 randi) randi
1.0 vdelay
dup 0.4 0.9 0.5 randi
0.2 1 sine 0.01 0.3 biscale
1.0 64 smoothdelay 0 1 0.2 randi *
+ +
dup jcrev -6 ampdb * + -1 1 limit
