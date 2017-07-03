# Generate sine wave lookup-table
_sine 8192 gen_sine
# create 440hz phasor signal (sawtooth moving between 0 and 1)
440 0 phasor
# feed phasor into tabread 
1 0 0 _sine tabread 
# scale signal
0.3 *
##--
