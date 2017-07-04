# earfloss
# paul batchelor
# july 2017
_buf 3 sr * zeros
512 _lpc lpcsynth
0.99 0 _lpc tset
2 metro 0.6 maygate 1 _lpc tset
0.1 4 _lpc tset
0.1 1 sine 1 9 biscale metro 0.1 0.9 switch 0.01 port 5 _lpc tset
0.5 1 sine 0.1 0.9 biscale metro 0 0.1 switch 6 _lpc tset
4000 butlp
60 50 3 eqfil
tick _buf tblrec 
0 _buf tbldur 1 20 2 randh randi 1 1 8192 _buf mincer -10 ampdb * 
dup 0.2 dmetro 0.1 maygate 0.01 port * 0.8 0.4 delay 40 0.9 streson dcblk +
+ 
-10 ampdb *
0.9 clip
