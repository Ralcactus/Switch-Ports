if (ready)
{
    timer_logic(0);
    timer_logic(1);
}

timer_logic(2);
timer_logic(3);
timer_logic(4);
timer_logic(5);

if (splash_go)
{
    splash_percent = approach(splash_percent, 1, 0.05);
    splash_scale = use_curve(acurv_splash, splash_percent, "out", 9, 0.85);
    
    if (splash_text_out)
        splash_alpha = approach(splash_alpha, 0, 0.1);
    else
        splash_alpha = approach(splash_alpha, 1, 0.1);
    
    if (ready)
        splash_alpha_bg = approach(splash_alpha_bg, 0, 0.1);
}

time += (global.delta_game_factor / 60);
if audio_emitter_exists(audio)
	audio_emitter_pitch(audio, global.speedup);
move_angle = time * 120;
x = xstart + lengthdir_x(circle_width, move_angle);
y = ystart + lengthdir_y(circle_height, move_angle);

if (out)
{
    if (out_scale <= _scaleto)
    {
        with (obj_frenzy)
            overlay_alpha = 0;
        
        with (par_microgame)
        {
            if (ID == other.ID)
                instance_destroy();
        }
        
        alarm[0] = 1;
    }
}
else
{
    out_scale = easy_smooth(out_scale, 1, 4);
}
