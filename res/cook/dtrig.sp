# delta times: 100ms and 500 ms
_delta "0.1 0.5" gen_vals

# dtrig. "tick" is used to start it looping
tick 1 0 1 _delta dtrig
# dtrig feeds into an envelope generator...
0.001 0.001 0.1 tenvx 
# and then that is multiplied by a sine wave
1000 0.5 sine *
