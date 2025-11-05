if (game_paused())
    exit;

var _curcycle = get_cycle(370);
firescale = 0;
firescale += lerp(0, 0.4, easy_sin(get_cycle_region(_curcycle, 200, 0, 25) / 25));
firescale += tween(0, 1, get_cycle_region(_curcycle, 240, 0, 20) / 20, EASE_OUT_BACK);
firescale += tween(1, 0, get_cycle_region(_curcycle, 0, 0, 10) / 10, EASE_IN_CUBIC);

if (_curcycle == 0)
{
    playedwarning = false;
    event_stop(loopsnd, false);
}

if (_curcycle >= 200 && !playedwarning)
{
    playedwarning = true;
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/crateflamestart", x, y);
}

if (_curcycle >= 240 && playedwarning && !event_isplaying(loopsnd))
    scr_fmod_soundeffect(loopsnd, x, y);

fire = _curcycle >= 240;
curpalette = !fire;
fireid.fire = fire;
fireid.firescale = firescale;
