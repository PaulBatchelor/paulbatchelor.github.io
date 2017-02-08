_seq "0 5 7 12 2 12 7 5" gen_vals
_filt "1000 2000 7000 3000 1000 1000 7000 1000" gen_vals
_bpm var
0 p 80 150 scale _bpm set
_seqlen var
1 p 8 * floor  _seqlen set
_res var
2 p 0 0.99 scale _res set
_det var
3 p 0.01 0.45 scale _det set
_phsr var
_key var
_dry var
_note var
_gt 4 palias
5 p (4 p 0.5 0 thresh) 0.05 tport 60 + _key set
_key get tick _key get 0 gt + samphold
_gt get 0.5 0 thresh
_bpm get bpm2rate 4 _seqlen get / * 0 tphasor _phsr set
_phsr get _seqlen get * floor _seq tget +
_note set
_note get 0.001 port mtof 0.3 saw
_note get _det get 1.123 * + 0.001 port mtof 0.3 saw +
_note get _det get - 0.001 port mtof 0.3 saw +
_phsr get _seqlen get * floor _filt tget
dup
_gt get 1.3 0.2 0.9 0.4 adsr * 
0.7 cf
0.001 port
_res get moogladder
_note get 12 - 0.001 port mtof 0.1 sine +
_gt get 0.001 0.1 0.9 0.3 adsr *
dup 7000 buthp 3 ampdb * +
_dry set
_dry get dup 0.85 8000 revsc drop -12 ampdb * _dry get +
_dry get 0.75 0.3 delay 6000 buthp -20 ampdb * +
