testvariablenothing = false;
event_inherited();
beep_sound = audio_play_sound(snd_macro_knives_sword_beep, 0, true);
hspd = -65;
rot_spd = 0;
timer[0] = 5;

timer_func[0] = function()
{
    var _fx = instance_create_depth(x, y, layer_get_depth(layer) + 1, obj_universal_fx);
    
    with (_fx)
    {
        anim_sprite = other.anim_sprite;
        anim_index = other.anim_index;
        bm = 1;
        fadeout = true;
        fade_spd = 0.05;
        image_alpha = 0.95;
        die_after_anim = false;
    }
    
    timer[0] = 4;
};

timer[1] = 45;

timer_func[1] = function()
{
    go = true;
    
    if (audio_is_playing(beep_sound))
        audio_stop_sound(beep_sound);
    
    audio_play_sound(snd_bosstrans_knives_jade_slash, 0, 0);
};

caution_ind = 0;
go = false;
