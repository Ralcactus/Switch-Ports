testvariablenothing = false;
time += global.delta_game_factor;
var _yAxis = input_check_pressed("down_menu") - input_check_pressed("up_menu");

if (_yAxis != 0 && ready)
{
    selected += _yAxis;
    
    if (selected < 0)
        selected = array_length(options[menu]) - 1;
    
    if (selected > (array_length(options[menu]) - 1))
        selected = 0;
    
    menu_scale[selected] = 1.1;
    audio_stop_play(snd_menu_blip, 0, 0);
}

for (var i = 0; i < array_length(menu_scale); i++)
    menu_scale[i] = easy_smooth(menu_scale[i], 1, 3.5);

if (ready && input_check_pressed("menu_confirm"))
{
    go_sound = snd_menu_go;
    options_func[menu][selected]();
    input_verb_consume("menu_confirm");
    audio_stop_play(go_sound, 0, 0);
}

if (input_check_pressed("cancel"))
{
    selected = array_length(options[menu]) - 1;
    audio_stop_play(snd_menu_blip, 0, 0);
    menu_scale[selected] = 1.1;
}

var _xAxis = input_check_pressed("right_menu") - input_check_pressed("left_menu");

if (_xAxis != 0)
{
    var _amnt = 0.1;
    
    if (menu == 2)
    {
        if (selected == 1)
        {
            global.window_scale += ((_xAxis * 1) / 6);
            
            if (global.window_scale < global.window_scale_min)
                global.window_scale = global.window_scale_min;
            
            var _w, _h;
            
            if (global.window_scale > global.window_scale_max)
            {
                global.window_scale = global.window_scale_max;
                _w = display_get_width();
                _h = display_get_height();
            }
            else
            {
                _w = round(1920 * global.window_scale);
                _h = round(1080 * global.window_scale);
            }
            
            window_set_size(_w, _h);
            window_center();
        }
    }
    else if (menu == 3)
    {
        if (selected == 0)
        {
            global.master_vol += (_amnt * _xAxis);
            global.master_vol = clamp(global.master_vol, 0, 1);
            
            with (obj_persistent)
                event_user(0);
        }
        else if (selected == 1)
        {
            global.bgm_vol += (_amnt * _xAxis);
            global.bgm_vol = clamp(global.bgm_vol, 0, 1);
            
            with (obj_persistent)
                event_user(0);
        }
        else if (selected == 2)
        {
            global.sfx_vol += (_amnt * _xAxis);
            global.sfx_vol = clamp(global.sfx_vol, 0, 1);
            
            with (obj_persistent)
                event_user(0);
        }
    }
}

var _str;

if (global.keyboard == 0)
    _str = "Arrows";
else
    _str = "WASD";

options[1][0] = string("Keyboard Scheme: {0}", _str);
var _x = window_get_width();
var _y = window_get_height();
_str = string("{0}x{1}", _x, _y);
options[2][1] = string("Resolution: {0}", _str);

if (global.texfilter)
    _str = "ON";
else
    _str = "OFF";

options[2][2] = string("Smooth Filter: {0}", _str);

if (global.vsync)
    _str = "ON";
else
    _str = "OFF";

options[2][3] = string("VSYNC: {0}", _str);
_str = round(global.master_vol * 100);
options[3][0] = string("MASTER VOL: {0}%", _str);
_str = round(global.bgm_vol * 100);
options[3][1] = string("BGM VOL: {0}%", _str);
_str = round(global.sfx_vol * 100);
options[3][2] = string("SFX VOL: {0}%", _str);
