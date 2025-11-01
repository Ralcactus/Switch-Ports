event_inherited();

event_hit = function()
{
    audio_stop_play(snd_bell, 0, 0);
    global.onoff++;
    
    if (global.onoff > global.onoff_max)
        global.onoff = global.onoff_min;
};

pal_sprite = pal_dynamiteblock;
