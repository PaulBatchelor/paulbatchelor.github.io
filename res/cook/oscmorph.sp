# some wave shapes
_sine 4096 gen_sine
_sinesum1 4096 "0 0 1 11" gen_sinesum
_saw 4096 "0 1 4096 -1" gen_line
_sinesum2 4096 "1 1 0 1" gen_sinesum

# 440 hz 0.3 amp
440 0.3 
# LFO oscillator modulating wave position
1 1 sine 0 1 biscale
# initial phase
0 
# 4 wave shapes
_sine _saw _sinesum1 _sinesum2 
oscmorph4
