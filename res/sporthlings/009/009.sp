# Drippy Nose
# Paul Batchelor
# January 16, 2017
_clk var
10 metro 

10 inv 1 sine 0 0.8 biscale maytrig _clk set

_clk get

# Adopted from sporth example drip.sp
# number of units/tubes
10 
# amplitude
_clk get 0.01 0.3 trand
# damp 
0.9 
# shake_max: amount of energy to add back into the system
0 
# main resonant frequency
_clk get 200 458 trand
# first resonant frequency 
_clk get 300 400 trand
# second resonant frequency
_clk get 600 900 trand
# period of time over which all sound is stopped
0.1 
drip

dup 0 0.7 0.4 randi 0.001 0.2 1 randi 0.3 64 smoothdelay + 1100 buthp

0.4 200 1 dust 

+

_clk get 0.1 maytrig dup 0.001 0.01 0.02 tenvx 
swap 1100 550 switch 0.09 sine * dup 0.8 1.0 delay + 

+

dup dup 20 20 10000 zrev drop -25 ampdb * + 
