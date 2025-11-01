anim_logic();
action_sub += ((sprite_get_speed(spr_Bu_skate_actionlines) / 60) * global.delta_game_factor * instance_find_micro(obj_Bu_skate_ramp).spd_mult);

if (on_ramp)
{
    if (audio_is_playing(skate_snd))
        audio_stop_sound(skate_snd);
    
    y -= (1.1 * global.delta_game_factor);
    
    if (input_check_pressed("jump", player) || input_check_pressed("up", player))
    {
        scr_micro_win();
        
        with (instance_find_micro(obj_Bu_skate_ramp))
            exit_ramp();
        
        anim_play(spr_Bu_skate_josh_ollie);
        vspd = -14.5;
        audio_play_sound_on(controller.audio, snd_Bu_skate_win, 0, 0);
    }
}
else if (y < ystart)
{
    vspd += (grav * global.delta_game_factor);
}

y += (vspd * global.delta_game_factor);

if (vspd > 0 && y >= (ystart + 30))
{
    if (controller.win)
        skate_snd = audio_play_sound_on(controller.audio, snd_Bu_skate_skating, 0, 0);
    
    y = ystart;
    vspd = 0;
    audio_play_sound_on(controller.audio, snd_Bu_skate_land, 0, 0);
    
    if (controller.win)
        anim_play(spr_Bu_skate_josh_idle);
    else
        anim_play(spr_Bu_skate_josh_fail);
    
    if (!controller.win)
    {
        audio_play_sound_on(controller.audio, snd_Bu_skate_fail, 0, 0);
        anim_speed = 0.5;
    }
}

if (anim_sprite == spr_Bu_skate_josh_ollie)
    angle = random_range(-0.5, 0.5);
else
    angle = 0;

xscale = approach(xscale, 1, 0.02);
yscale = approach(yscale, 1, 0.02);

if (action_fadeout)
    action_alpha = approach(action_alpha, 0, 0.1);
