# here have some computer music you jerk
# paul batchelor
# feb 2017

_bpm 70 varset
_rel 0.03 varset
_freq 100 varset
_b1 400 varset
_b2 500 varset

0 1 (0 4 3 randi) randh 1 210 scale _bpm set
30 inv 1 sine  0.005 0.1 scale _rel set
0.5 0.3 1 10 jitter +  30 200 scale _freq set
0 1 10 randi 100 800 scale _b1 set
0 1 1 randh 0.1 port 100 800 scale _b2 set

0 _bpm get 4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 4 0 count 0.5 2 thresh (_freq get 8 *) (_b1 get) switch 0.5 sine *

0 _bpm get 2 +  4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 4 0 count 0.5 2 thresh (_freq get 9 *) (_b1 get) switch 0.2 tri * +
 
0 _bpm get 2 - 4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 4 0 count 0.5 2 thresh (_freq get 10 * ) (_b1 get) switch 0.5 sine * +


0 _bpm get 1 +  4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 5 0 count 0.5 2 thresh (_freq get 11 *) (_b2 get) switch 0.5 sine * +

0 _bpm get 3 + 4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 5 0 count 0.5 2 thresh (_freq get 12 * ) (_b2 get) switch 0.2 tri * +

0 _bpm get 1 - 4 clock dup 0 pset 0.004 0 _rel get tenv 
0 p 5 0 count 0.5 2 thresh (_freq get 13 * ) (_b2 get) switch 0.5 sine * +

-10 ampdb * 

dup jcrev + 
