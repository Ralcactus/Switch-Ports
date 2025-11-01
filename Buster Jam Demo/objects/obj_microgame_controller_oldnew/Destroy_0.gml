var _destroyBG = true;

with (obj_microgame_controller)
{
    if (!ended)
        _destroyBG = false;
}

if (_destroyBG)
{
    with (obj_frenzy_bg)
        instance_destroy();
}

if (!scored && win)
    scr_micro_win();
