<CsoundSynthesizer>
<CsInstruments>
sr	=	96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1

alwayson "reverb"

gaRev init 0

instr 1	
icps = cpsmidinn(p4)
a1 pluck 0.1, icps, icps, 0, 1
a1 *= linsegr(1, 1, 0)
outs a1, a1
gaRev += a1 * 0.3
endin

instr reverb
aL, aR reverbsc gaRev, gaRev, 0.97, 10000
clear gaRev
outs aL, aR
endin
</CsInstruments>
</CsoundSynthesizer>

