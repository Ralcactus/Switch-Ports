testvariablenothing = false;
event_inherited();
draw_me = true;
sprite_prefetch(spr_bosstrans_knives_2_kick);
sprite_prefetch(spr_bosstrans_knives_2_end);
hp_x = 1216;
hp_y = 992;
score_x = 128;
score_y = 160;
bg_effect_alpha = 0;
hit = false;

event_hit = function()
{
    bg_effect_alpha = 1.2;
    shake = 1;
    zoom = 1.2;
    hit = true;
    
    if (instance_exists(obj_frenzy))
        audio_play_sound_on(obj_frenzy.emitter, snd_bosstrans_knives_hit, false, 0);
    else
        audio_play_sound(snd_bosstrans_knives_hit, 0, false);
    
    with (par_boss)
        no_blend = true;
};

zoom = 1;
shake = 0;
anim_init();
anim_sprite = spr_bosstrans_knives_2_idle;

event_animend = function()
{
    if (anim_sprite == spr_bosstrans_knives_2_kick)
        anim_play(spr_bosstrans_knives_2_end);
};

timer[0] = time_bpm_to_seconds(140) * 60 * 1;

timer_func[0] = function()
{
    anim_play(spr_bosstrans_knives_2_kick);
    audio_play_sound(snd_bosstrans_knives_jade_slash, 0, false);
};
