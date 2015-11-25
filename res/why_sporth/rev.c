#include <stdlib.h>
#include <stdio.h>
#include "soundpipe.h"

typedef struct {
    sp_diskin *disk;
    sp_revsc *rev;
} UserData;

void process(sp_data *sp, void *udata) {
    UserData *ud= udata;
    SPFLOAT in = 0;
    SPFLOAT out = 0;
    SPFLOAT foo = 0;

    sp_diskin_compute(sp, ud->disk, NULL, &in);
    sp_revsc_compute(sp, ud->rev, &in, &in, &sp->out[0], &foo); 
}

int main() {
    UserData ud;
    sp_data *sp;
    sp_create(&sp);

    sp_diskin_create(&ud.disk);
    sp_revsc_create(&ud.rev);

    sp_diskin_init(sp, ud.disk, "piano.wav");
    sp_revsc_init(sp, ud.rev);
    ud.rev->feedback = 0.97;
    ud.rev->lpfreq = 10000;

    sp->len = 44100 * 10;
    sp_process(sp, &ud, process);

    sp_diskin_destroy(&ud.disk);
    sp_revsc_destroy(&ud.rev);
    sp_destroy(&sp);
    return 0;
}
