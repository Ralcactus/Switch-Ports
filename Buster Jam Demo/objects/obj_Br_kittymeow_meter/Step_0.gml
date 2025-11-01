if (done)
    exit;

if (controller.ended)
{
    if (!done)
        event_user(0);
    
    done = true;
    exit;
}

timer_logic(0);

if (input_check_pressed("jump"))
{
    if (strength >= 11)
    {
        shake = 20;
        scr_micro_win();
        audio_play_sound_on(controller.audio, snd_Br_kittyscream, 0, 0);
        
        with (obj_Br_kittymeow_kitty)
        {
            anim_play(spr_Br_kittymeow_kitty_roar);
            x = 973;
            y = 776;
        }
        
        with (obj_Br_kittymeow_lion)
        {
            anim_play(spr_Br_kittymeow_lion_yo);
            x = 488;
            y = 778;
            hspd = -15;
        }
    }
    else
    {
        event_user(0);
    }
    
    done = true;
}
