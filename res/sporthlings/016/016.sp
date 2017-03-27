# endless shores
# paul batchelor
# march 2017 

_buf sr 3 * zeros
15 inv 1 sine 1 10 biscale metro 
0.001 0.001 0.001 tenvx brown *
3 4 waveset

69 mtof 0.99 streson dcblk

tick _buf tblrec drop

0 _buf tbldur 1 randi 0.4 2 32 _buf mincer 

dup 

dup 10 10 8000 zrev drop -3 ampdb * 

dup 58 mtof 0.9 streson
swap 65 mtof 0.9 streson + dcblk 

0 1 0.1 1 rspline cf

dup 0.9 1.0 delay -8 ampdb * 500 buthp + 

2000 butlp

