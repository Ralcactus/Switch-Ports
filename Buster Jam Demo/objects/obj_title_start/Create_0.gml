testvariablenothing = false;
global.speedup = 1;
audio_stop_all();
global.spawnID = 0;
global.bgm = -4;
global.bgm_play = -4;
global.frenzy_nextroom = undefined;
scr_reset_save_data();
global.bgm_play = audio_play_sound(bgm_title, 0, true);
bpm = 129;
beats = 0;
copyright_alpha = 1;
ds_map_clear(global.map_got);
logo_x = x;
logo_y = y;
logo_scale_start = image_xscale;
percent_logo = 1;
logo_scale = 1;
logo_start = 0.975;
time = 0;
menu_scale = 1;
go = false;
set_ready = false;
slide_out = false;
slide_in = false;
yoff = 0;
percent_yoff = 0;
timer[0] = -1;

timer_func[0] = function()
{
    slide_out = true;
};

timer[1] = -1;

timer_func[1] = function()
{
    timer[1] = 7;
    press_any_alpha = !press_any_alpha;
    press_count++;
    
    if (press_count >= 11)
        timer[1] = -1;
};

press_count = 0;
press_any_alpha = 1;
menu = instance_create_layer(0, 0, "GUI_Over", obj_title_menu);
