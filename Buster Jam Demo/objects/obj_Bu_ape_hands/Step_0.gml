anim_logic();
timer_logic(0);
var _allow = true;

if (controller.ended && !controller.win)
    _allow = false;

if (_allow && input_check_pressed("jump"))
{
    tickles++;
    
    if (tickles == 3 || tickles == 6 || tickles == 9)
    {
        with (obj_Bu_ape)
        {
            anim_play(spr_Bu_ape_laugh);
            timer[0] = 8;
        }
    }
    
    if (tickles == tickles_needed)
    {
        with (obj_Bu_ape)
        {
            anim_play(spr_Bu_ape_lol_trans);
            timer[0] = -1;
        }
        
        scr_micro_win();
        audio_play_sound_on(controller.audio, snd_micro_ape_giggle, false, 0);
    }
    
    timer[0] = 12;
    
    if (anim_sprite != spr_Bu_ape_hands_tickle)
    {
        anim_play(spr_Bu_ape_hands_tickle);
        
        if (audio_is_playing(snd_Bu_ape_tickle))
            audio_stop_sound(snd_Bu_ape_tickle);
        
        audio_play_sound_on(controller.audio, snd_Bu_ape_tickle, true, 0);
    }
}

if (anim_sprite != spr_Bu_ape_hands_tickle && audio_is_playing(snd_Bu_ape_tickle))
    audio_stop_sound(snd_Bu_ape_tickle);

if (controller.ended && tickles < tickles_needed && !done)
{
    done = true;
    
    with (obj_Bu_ape)
        anim_play(spr_Bu_ape_youwilldie);
    
    obj_Bu_ape_grab.draw_me = true;
    audio_play_sound_on(controller.audio, snd_micro_ape_yell, false, 0);
    timer[0] = -1;
    anim_play(spr_Bu_ape_hands_scared);
}

if (obj_Bu_ape.anim_sprite == spr_Bu_ape_youwilldie)
    y = easy_smooth(y, ystart + 40, 4);
