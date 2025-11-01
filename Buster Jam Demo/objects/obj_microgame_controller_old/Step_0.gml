var _bgm = micro_bgm_play;
bpm = 280;

if (audio_is_playing(_bgm) && bpm != -4)
{
    var _pos = audio_sound_get_track_position(_bgm);
    var _beat = false;
    
    while (((beats - 1) * time_bpm_to_seconds(bpm)) >= _pos)
    {
        beats--;
        
        if (((beats - 1) * time_bpm_to_seconds(bpm)) < _pos)
            beats--;
    }
    
    while (_pos >= (time_bpm_to_seconds(bpm) * beats))
    {
        beats++;
        _beat = true;
    }
    
    if (_beat)
    {
        if (((beats - 1) % 2) == 0)
            global.beat = true;
    }
}

bom_shake = approach(bom_shake, 0, 0.05);
overlay_alpha = approach(overlay_alpha, 0, 0.04);

if (timer_in)
    timer_alpha = approach(timer_alpha, 1, 0.15);

time_xmove += (xmove_spd * global.delta_game_factor);
time_ymove += (ymove_spd * global.delta_game_factor);
scroll_x += (scroll_xspd * global.delta_game_factor);

if (scroll_x < -1920 || scroll_x > 1920)
    scroll_x -= scroll_x;

xmove = sin(time_xmove * pi) * xmove_length;
ymove = cos(time_ymove * pi) * ymove_length;

if (bounce)
{
    bounce_vspd += (bounce_grav * bounce_mult * global.delta_game_factor);
    bounce_y += (bounce_vspd * global.delta_game_factor);
    
    if ((bounce_y + bounce_vspd) > 100 && bounce_vspd > 0)
        bounce_vspd = bounce_height * bounce_mult;
}

timer_logic(6);
jumpcut_off = approach(jumpcut_off, 0, 0.1);

for (var i = 0; i < 2; i++)
{
    screenshake_draw[i] = random_range(-screenshake[i], screenshake[i]);
    screenshake[i] = approach(screenshake[i], 0, screenshake_dec);
}
