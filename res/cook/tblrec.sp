# create a 2-second long buffer called "in"
_in sr 2 * zeros

# a small plucked instrument patch
1 metro dup 300 800 trand 0.5 100 pluck 

# record the patch using tblrec. "tick" makes it start recording indefinitely
tick _in tblrec 

# drop the dry signal
drop

# create a jitter signal between 0 and the position of the input buffer
0 _in tbldur (2 10 1 randh) randi 

# mince it up using mincer
1 1 2048 _in mincer

