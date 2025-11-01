alarm[0] = 1;
global.game_music = "bgm_micro_mugshot";
global.game_music_loops = true;
timer[0] = -1;

timer_func[0] = function()
{
    xoff_to -= char_sep;
    xoff_start = xoff;
    percent = 0;
};

timer[1] = -1;

timer_func[1] = function()
{
    with (obj_micro_mugshot_char)
    {
        if (ID == other.ID)
            instance_destroy();
    }
    
    if (controller.win)
        scr_micro_win();
    
    snap_state = 2;
};

snap_state = 0;
flash = 0;
Bu = spr_mugshot_buster;
Br = spr_mugshot_bridget;
Zi = spr_mugshot_zig;
Ed = spr_mugshot_eddy;
Wi = spr_mugshot_wizard;
target = Wi;
timer[2] = -1;

timer_func[2] = function()
{
    ready = true;
};

ready = false;
wanted_alpha = 1;
win_ind = 0;
