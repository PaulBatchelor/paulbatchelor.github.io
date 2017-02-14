# djambe
# paul batchelor
# feb 14 2017

_f1 500 varset
_f2 1500 varset
_q1 2 varset
_q2 12 varset
_f3 450 varset
_f4 650 varset
_q3 30 varset
_q4 40 varset
_imp var
_exc var
_bpm var

135 10 0.1 2 jitter + dup _bpm set
"4(+--+--+-)-{4(-++?)|2(++)}|3(+{2(??)|+}+)3(+?+)3(-++)2(++)|4(++++)" prop 
dup 0.5 0.8 trand *
_imp set

_imp get 0.003 _imp get 0.001 0.005 trand 
_imp get 0.002 0.005 trand tenvx 0.2 noise * _exc set
_exc get _f1 get _q1 get mode
_exc get _f2 get _q2 get mode +
-3 ampdb * 
dup
 
dup _f3 get _q3 get _imp get 0.3 1.5 trand * mode
swap _f4 get 10 0.1 1 jitter + _q4 get _imp get 0.8 1.8 trand * mode + +

-20 ampdb * 

0.8 clip

dup _imp get 0.3 maytrig 0.001 0.01 0.1 tenv * dup 20 8 10000 zrev drop 0.1 * + 
