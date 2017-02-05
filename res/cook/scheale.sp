# Scheale
# By Paul Batchelor
# August 2015
"seq_1"
"62 69 64 69"
gen_vals
"seq_2"
"73 76 66 71"
gen_vals
1
54 "+2(++)--" prop 0 branch
0.78 maytrig dup
0.004 0.05 0.5 0.8 0.2 randi tenv 
swap dup
dup 1000 12 mode
swap 3000 8 mode
add 0.3 mul dup
rot dup dup 0 "seq_2" tseq
swap dup 0 "seq_1" tseq
swap 0.5 maytrig rot rot switch
swap 3 0 count 0 eq 12 0 branch add
0.001 port
-0.15 0.15 0.2 randi add
mtof dup rot swap
300 2000 0.12 randi mode
swap rot swap 2.01081 mul 100 1000 0.1 randi mode
add 0.15 mul
mul
0.3 clip 1000 butlp
dup 0.76 0.75 delay 0.2 mul 1000 butlp
swap dup dup 0.97 10000 revsc 0.3 mul swap 0.3 mul
rot dup rot add
rot rot add 
rot dup rot add
rot rot add 
drop
