testvariablenothing = false;

if (audio_is_playing(global.bgm_play))
{
    var _bgm = global.bgm_play;
    
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
            global.beat = true;
            
            if ((beats % 2) == 1)
                global.beat_double = true;
        }
    }
}

logo_scale = use_curve(acurv_elastic_less, percent_logo, undefined, logo_start, 1);
percent_logo = approach(percent_logo, 1, 0.07);
time += global.delta_game_factor;
var _array = [112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123];
var _anykey = false;

if (keyboard_check_pressed(vk_anykey) && !array_contains(_array, keyboard_lastkey))
    _anykey = true;

if ((_anykey || input_check_pressed("jump") || input_check_pressed("pause") || input_check_pressed("action") || input_check_pressed("cancel") || input_check_pressed("left_menu") || input_check_pressed("right_menu") || input_check_pressed("up_menu") || input_check_pressed("down_menu")) && !go)
{
    go = true;
    audio_play_sound(snd_Bu_coin_win, 0, 0);
    timer[0] = 50;
    timer_func[1]();
    percent_yoff = 0;
    
    with (obj_title_menu)
    {
        timer[3] = 78;
        desc_x = desc_x_start;
        desc_loop = false;
    }
    
    menu.draw_me = true;
}

if (slide_in)
{
    percent_yoff = approach(percent_yoff, 1, 0.015384615384615385);
    yoff = use_curve(acurv_mugshot, percent_yoff, undefined, -1080, 0);
    copyright_alpha = use_curve(acurv_mugshot, percent_yoff, undefined, 0, 1);
    
    if (percent_yoff == 1)
    {
        slide_in = false;
        go = false;
        menu.draw_me = false;
        menu.selected = 0;
    }
}

if (slide_out)
{
    percent_yoff = approach(percent_yoff, 1, 0.015384615384615385);
    
    if (percent_yoff >= 0.9 && !set_ready)
    {
        menu.ready = true;
        set_ready = true;
    }
    
    yoff = use_curve(acurv_mugshot, percent_yoff, undefined, 0, -1080);
    copyright_alpha = approach(copyright_alpha, 0, 0.08);
}

timer_logic(0);
timer_logic(1);
