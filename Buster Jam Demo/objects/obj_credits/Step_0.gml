testvariablenothing = false;
var _scrollspd = 16;
var _yAxis = input_check("down") - input_check("up");
scroll_yto -= (_yAxis * _scrollspd);

if (scroll_yto > 0)
    scroll_yto = 0;

if (scroll_yto < scroll_max)
    scroll_yto = scroll_max;

scroll_y = easy_smooth(scroll_y, scroll_yto, 4);

if (input_check_pressed("cancel"))
{
    audio_play_sound(snd_menu_back, 0, 0);
    
    with (obj_title_menu)
    {
        ready = true;
        credits = false;
    }
    
    input_verb_consume("cancel");
    instance_destroy();
}
