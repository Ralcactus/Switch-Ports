if (game_paused() || !visible || !player_collideable())
    exit;

with (instance_create_depth(x, y, depth, par_collect))
{
    value = 10;
    splitfactor = 10;
    splittime = 5;
    particlespr = [spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5];
    canmagnetise = false;
    splitsound = "event:/sfx/player/collect";
    saveroom = false;
    event_user(0);
}

obj_drawcontroller.pumpkinatimer = 200;
global.pumpkintotal++;
var _text = "tips/pumpkin/gotanyplural";

if (global.pumpkintotal == 5)
    _text = "tips/pumpkin/gothalf";

if (global.pumpkintotal == 9)
    _text = "tips/pumpkin/gotanysingular";

if (global.pumpkintotal >= 10)
    _text = "tips/pumpkin/gotall";

scr_tiptext(string_get(_text, 10 - global.pumpkintotal));
scr_fmod_soundeffectONESHOT("event:/sfx/misc/pumpkincollect", x, y);

repeat (5)
    scr_createparticle(false, x, y, depth, spr_pumpkindebris, 1, 1, irandom(4), 0, irandom(360), 0.5, irandom_range(-4, 4), irandom_range(-6, -2), irandom_range(-2, 2));

instance_destroy();
