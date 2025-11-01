testvariablenothing = false;
var _sep = 130;
time += (1 * global.delta_game_factor);

if (input_check_pressed("cancel") && ready)
{
    audio_stop_play(snd_menu_back, 0, 0);
    ready = false;
    timer[3] = -1;
    timer[4] = 20;
    
    with (obj_title_start)
    {
        slide_in = true;
        slide_out = false;
        timer[0] = -1;
        timer[1] = -1;
        press_any_alpha = 1;
        percent_yoff = 0;
        set_ready = false;
        press_count = 0;
    }
}

if (ready && input_check_pressed("menu_extra") && selected == 1)
{
    ready = false;
    
    if (global.steam_pfp == undefined)
    {
        var _inst = instance_create_layer(0, 0, "GUI", obj_network_getstats);
        
        _inst.event_success = function()
        {
            instance_create_layer(0, 0, "GUI", obj_leaderboard);
        };
        
        _inst.event_fail = function()
        {
            with (obj_title_menu)
                ready = true;
        };
    }
    else
    {
        instance_create_layer(0, 0, "GUI", obj_leaderboard);
    }
}

var _yAxis = input_check_pressed("down_menu") - input_check_pressed("up_menu");

if (_yAxis != 0 && ready)
{
    selected += _yAxis;
    
    if (selected < 0)
    {
        selected = array_length(menu) - 1;
        bar_y = (_sep * (array_length(menu) - 1)) + 45;
    }
    
    if (selected > (array_length(menu) - 1))
    {
        selected = 0;
        bar_y = -45;
    }
    
    menu_scale[selected] = 1.1;
    graphic_scale = 1.03;
    percent_xoff = 0;
    desc_x = desc_x_start;
    desc_loop = false;
    timer[2] = 240;
    audio_stop_play(snd_menu_blip, 0, 0);
    
    if (selected == 1)
        text_confirm = "<glyph gp_cross> Confirm <glyph gp_triangle> Leaderboard";
    else
        text_confirm = "<glyph gp_cross> Confirm";
    
    scr_dialogue_reset(text_confirm, true);
    type_index = string_length(text_confirm);
}

if (!bars_out)
    desc_x -= (5 * global.delta_game_factor);

draw_set_font(global.font_dialogue);
var _w = (string_width(desc[selected]) * desc_xscale) + desc_sep;

if (desc_x <= -_w && desc_loop)
    desc_x += _w;

percent_xoff = approach(percent_xoff, 1, 0.05);
selected_xoff = use_curve(acurv_elastic, percent_xoff, undefined, 0.5, 1);

if (ready && input_check_pressed("menu_confirm"))
{
    event_user(selected);
    timer_func[0]();
    ready = false;
    timer[1] = 28;
    audio_play_sound(snd_menu_go, 0, 0);
}

for (var i = 0; i < array_length(menu); i++)
    menu_scale[i] = easy_smooth(menu_scale[i], 1, 3.5);

graphic_scale = easy_smooth(graphic_scale, 1, 3.5);

if (instance_exists(obj_title_start))
    yoff = obj_title_start.yoff + 1080;

timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);

if (move_bars_in)
{
    bars_out = easy_smooth(bars_out, 0, 8);
}
else
{
    percent_bars = approach(percent_bars, 1, 0.05);
    bars_out = use_curve(acurv_linear, percent_bars, "in", 0, 1);
}
