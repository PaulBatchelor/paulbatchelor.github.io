_wav 8192 gen_sine
_d var

2 
0.2 1 0 _wav osc 5 20 biscale
1 dust dup _d set

1100 1.9 0 wpkorg35

jcrev 

_d get 0.5 maytrig 0.01 tgate 0.001 port 
1000 0.3 0 _wav osc *  + 

_d get 0.5 maytrig 0.004 tgate 0.001 port 
2000 0.3 0 _wav osc *  + 

_d get 0.2 maytrig 0.004 tgate 0.001 port 
500 0.3 0 _wav osc *  + 

_d get 0.3 maytrig 0.04 tgate 0.005 port 
-0.05 0.05 sr _d get 4 40 trand / randh * + 

dup _d get 0.1 maytrig 0.4 0.1 0.1 tenv * 0.6 0.3 delay 
12 1024 512 pshift 1000 butlp -6 ampdb * 
+ 
