palettespr = obj_player.palettespr;
curpalette = obj_player.curpalette;
var _attr = new Fmod3DAttributes();
_attr.position.x = x;
_attr.position.y = y;
_attr.position.z = 0;
_attr.forward.z = 1;
_attr.up.y = 1;
event_set_3d_position_struct(screamsnd, _attr);

if (flung && flungval < 1)
    flungval += 0.02;

if (flung && flungval >= 1 && !splatted)
{
    event_stop(screamsnd, true);
    scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y, depth);
    shakecam(40, 5);
    splatted = true;
    gamepadvibrate(0.3, 0, 2);
    alarm[0] = 60;
}

if (splatted)
{
    splatscale = max(splatscale - 0.05, 1);
    var _spd = 8;
    
    if (splattedslide)
    {
        stretch += _spd;
        splattedy += (_spd * clamp((30 - alarm[1]) / 30, 0, 1));
    }
}

x = lerp(0, obj_drawcontroller.camX, flungval);
y = lerp(390, obj_drawcontroller.camY - 20, flungval);
depth = lerp(1230, 60, flungval);
y -= (easy_sin(flungval) * 400);
