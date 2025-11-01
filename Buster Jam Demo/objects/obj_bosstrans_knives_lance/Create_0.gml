testvariablenothing = false;
event_inherited();
draw_me = true;
buster_spr = spr_bosstrans_knives_0_buster_idle;
buster_ind = 0;
buster_yoff = 1000;
buster_rise = false;
lance_spr = spr_bosstrans_knives_0_lance_idle;
lance_ind = 0;
buster_alpha = 1;
lance_alpha = 1;
bg_effect_alpha = 0;
hp_x = 128;
hp_y = 992;
score_x = 1472;
score_y = 896;
hp_x = 160;
hp_y = 992;

event_animend_buster = function()
{
    var _loop = true;
    
    switch (buster_spr)
    {
        case spr_bosstrans_knives_0_buster_punch:
            buster_spr = spr_bosstrans_knives_0_buster_punch_idle;
            buster_ind = 0;
            
            if (!hit)
                event_hit();
            
            _loop = false;
            break;
    }
    
    if (_loop)
        buster_ind -= buster_ind;
};

event_animend_lance = function()
{
    var _loop = true;
    
    if (_loop)
        lance_ind -= lance_ind;
};

event_beat_action = function()
{
    buster_spr = spr_bosstrans_knives_0_buster_punch;
    buster_ind = 0;
};

timer[0] = (time_bpm_to_seconds(140) * 60 * 3) - 16.666666666666668;

timer_func[0] = function()
{
    event_beat_action();
};

timer[1] = 5;

timer_func[1] = function()
{
    buster_rise = true;
};

hit = false;

event_hit = function()
{
    lance_alpha = 0;
    bg_effect_alpha = 1.2;
    shake = 1;
    zoom = 1.2;
    hit = true;
    
    if (instance_exists(obj_frenzy))
        audio_play_sound_on(obj_frenzy.emitter, snd_bosstrans_knives_hit, false, 0);
    else
        audio_play_sound(snd_bosstrans_knives_hit, 0, false);
    
    instance_create_layer(854, 859, layer, obj_bosstrans_knives_lance_knife);
    
    with (par_boss)
        no_blend = true;
};

zoom = 1;
shake = 0;
