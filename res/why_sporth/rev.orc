sr = 44100
ksmps = 1
nchnls = 1
0dbfs = 1

instr 1
    ainput diskin2 "piano.wav", 1
    aoutL, aoutR reverbsc ainput, ainput, 0.97, 10000
    out aoutL
endin
