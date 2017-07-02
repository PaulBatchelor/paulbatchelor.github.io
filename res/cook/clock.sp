# Generate 120 BPM clock signal
0 120 1 clock 
# Feed clock into exponential envelope generator
0.001 0.001 0.05 tenvx 
# Multiply envelope with sine wave
1000 0.5 sine *
