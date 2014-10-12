require("xmt")

math.randomseed(os.time())

function split(string)
    local tbl = {}
    for c in string:gmatch "." do
        if(c ~= ' ') then
            table.insert(tbl, c)
        end
    end
    return tbl
end


function add_pattern(args)
    local step = args.step or 1
    local chan = args.chan or 0
    local ins = args.ins or -1
    local pos = args.pos or 0
    local pat = args.pat or 0
    local its = args.its or 1
    local nn = args.nn or 60
    local stutter = args.stutter or {0}

    for i = 1, its, 1 do
        for j, n in pairs(pat) do
            if(n == '-') then
                x.tbl[chan + 1][pos + 1] = makenote(nn, ins)
                if(rchoice(stutter) == 1 and (pos + 2) < #x.tbl[chan + 1]) then
                    x.tbl[chan + 1][pos + 2] = makenote(nn, ins, 0x30)
                end
            elseif(n == '^') then
                x.tbl[chan + 1][pos + 1] = makenote(nn, ins, 0x20)
            end
            pos = pos + step
        end
    end
end

function rchoice(tbl) return tbl[math.random(#tbl)]
end

function random_retrig(args)
    local chan = args.chan or 1
    local len = #x.tbl[chan + 1]
    local choices = args.choices or {0}
    for n = 1, len, 1 do
        x.tbl[chan + 1][n].fx = 0xE
        x.tbl[chan + 1][n].param = 0x90 + rchoice(choices)
    end
end

function random_notes(args)
    local chan = args.chan or 1
    local len = #x.tbl[chan + 1]
    local choices = args.choices or {0}
    for n = 1, len, 1 do
        if(x.tbl[chan + 1][n].nn ~= -1) then
            x.tbl[chan + 1][n].nn = rchoice(choices)
        end
    end
end

function write_pattern(xm, tbl, patnum)
    for chan = 1, 4, 1 do
        for row = 1, #tbl[1], 1 do
            --x.tbl[chan][note] = makenote()
            xm:addnote(patnum, chan - 1, row - 1, tbl[chan][row])
        end
    end
end

x = XMT:create({nchan = 4, bpm = 166, speed = 3})

patlen = 0x80
barstep = 0x80 / 4


snare = x:addins() x:addsamp(snare, "../samples/snare.wav")
kick = x:addins() x:addsamp(kick, "../samples/kick.wav")
hihat = x:addins() x:addsamp(hihat, "../samples/hihat.wav")
altsnare = x:addins() x:addsamp(altsnare , "../samples/snare2.wav")


for pat = 0, 3, 1 do
    x:create_pattern(patlen)
    x:update_ptable(pat, pat)
    --x:set_pat_len(pat, 0x80)
    --x:set_pat_len(pat + 1, 0x80)

    x.tbl = {}

    for chan = 1, 4, 1 do
        x.tbl[chan] = {}
        for note = 1, patlen, 1 do
            x.tbl[chan][note] = makenote()
        end
    end

    pat1a = "-... .... ..-. -...";
    pat1b = "-... ..-. .... -...";
    pat1c = "-... ..-. .... -.^^";
    pat2a = ".... -... .... -..-";
    pat2b = ".... -... .... -...";
    pat2c = "...^ -... .... ^.-^";
    pat3a = "-^^- ^^-^ ^^-^ -^-^";
    pat3b = "^^-^ ^-^^ -^^^ --^^";
    pat4a = ".... .... -..- ..-.";
    pat4b = ".... .... .... ..-.";
    pat4c = ".... .... .... ....";

    for s = 0, 3, 1 do 
        add_pattern({
        pos = s * barstep, step = 2, 
        chan = 0, ins = kick, 
        pat = split(rchoice({pat1a, pat1b, pat1c}))
        })
    end

    for s = 0, 3, 1 do 
        add_pattern({
        pos = s * barstep, step = 2, 
        chan = 1, ins = snare, 
        pat = split(rchoice({pat2a, pat2b, pat2c}))
        })
    end

    for s = 0, 3, 1 do 
        add_pattern({
        pos = s * barstep, step = 2, 
        chan = 2, ins = hihat, 
        stutter = {0, 0, 0, 0, 1},
        pat = split(rchoice({pat3a, pat3b}))
        })
    end

    for s = 0, 3, 1 do 
        add_pattern({
        pos = s * barstep, step = 2, 
        chan = 3, ins = altsnare, 
        nn = 58,
        pat = split(rchoice({pat4a, pat4b, pat4c}))
        })
    end

    random_notes({chan = 2, choices = {60, 61, 60, 59} })
    random_notes({chan = 3, choices = {58, 59, 58, 57} })

    write_pattern(x, x.tbl, pat)
end
x:write("ex2.xm")
