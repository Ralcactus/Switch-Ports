if (state == 1)
{
    percent_slide = approach(percent_slide, 1, 0.006);
    x = use_curve(acurv_basics, percent_slide, "ease_inout", 960, 1460);
    obj_results_niceone.image_alpha = use_curve(acurv_basics, percent_slide, "ease_inout", 1, 0);
    
    if (percent_slide == 1)
        state = 2;
}
else if (state == 2)
{
    obj_results_niceone.pattern_alpha = approach(obj_results_niceone.pattern_alpha, 1, 0.02);
    results_alpha = approach(results_alpha, 1, 0.02);
    percent_xoff = approach(percent_xoff, 1, 0.004);
    xoff = use_curve(acurv_basics, percent_xoff, "ease_inout", xoff, 0);
    
    if (percent_xoff == 1 && tally == 0 && alarm[2] == -1)
        alarm[2] = 60;
}

if (tally == 1)
{
    dollars = approach(dollars, global.dollars, 1);
    
    if (tally_snd)
        tally_snd--;
    
    if (tally_snd == 0)
    {
        mySnd = audio_stop_play(snd_coin, 0, 0);
        audio_sound_gain(mySnd, 0.6, 0);
        dollars_flash = !dollars_flash;
        tally_snd = 3;
        
        for (var i = 0; i < choose(2, 3, 4); i++)
            part_particles_create(global.part_gui, 1248 + irandom_range(0, 588), 105 + irandom_range(0, 138), global.particles.sparkleGreen, 1);
    }
    
    if (dollars == global.dollars && alarm[3] == -1)
    {
        if (has_food)
            alarm[3] = 90;
        else
            alarm[4] = 60;
        
        audio_play_sound(snd_kaching, 0, 0);
        tally_snd = -1;
        dollars_flash = 0;
        tally = 2;
    }
}

if (dollars > highscore && !highscore_played)
{
    highscore_played = true;
    audio_play_sound(snd_meter, 0, 0);
    highscore_flash = 1;
}

if (input.pressed[4] && !deac && state >= 0)
{
    if (done)
    {
        if (audio_is_playing(bgm))
            audio_sound_gain(bgm, 0, 800);
        
        room_goto_triangles(rm_title);
        deac = true;
    }
    else
    {
        alarm[0] = -1;
        x = 1460;
        obj_results_niceone.image_alpha = 0;
        state = 2;
        results_alpha = 1;
        percent_xoff = 1;
        tally = 3;
        dollars = global.dollars;
        dollars_flash = false;
        
        for (var i = 0; i < 3; i++)
            food[i] = global.food[i];
        
        event_user(0);
    }
}

if (done)
{
    controls_alpha = approach(controls_alpha, 1, 0.05);
    control.image_alpha = controls_alpha;
}

camera_set_view_pos(view_camera[0], x - 960, y - 540);
camera_set_view_size(view_camera[0], 1920 * zoom, 1080 * zoom);
