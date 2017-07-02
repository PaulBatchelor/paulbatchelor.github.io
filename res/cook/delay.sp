# create two identical trigger signals
1 metro dup
# feed one trigger into tenvx
0.001 0.001 0.01 tenvx 
# get the other trigger, and feed into triggerable random number generator
swap 300 1000 trand 
# the RNG feeds into the freq parameter of sine
0.5 sine 
# multiply sine with envelope
*
# split sine wave signal
dup 
# feed one of the signals into delay line with 375ms delay and 80% feedback
0.8 0.375 delay 
# mix dry and wet signals back together
+
