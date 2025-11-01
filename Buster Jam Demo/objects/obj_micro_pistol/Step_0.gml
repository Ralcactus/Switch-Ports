if (input_check_pressed("jump") && !deac)
{
    var _fx = instance_create_micro(0, 0, layer, obj_micro_pistol_fx);
    
    with (_fx)
        anim_play(spr_micro_pistol_fx);
    
    if (audio_is_playing(my_gunshot_snd))
        audio_stop_sound(my_gunshot_snd);
    
    my_gunshot_snd = audio_play_sound_on(controller.audio, snd_gunshot, false, 0);
    percent = 0;
    
    with (obj_micro_pistol_demon)
    {
        if (ID == other.ID)
            event_user(0);
    }
}

angle = use_curve(acurv_elastic, percent, undefined, angle_start, 0);
percent = approach(percent, 1, 0.068);
