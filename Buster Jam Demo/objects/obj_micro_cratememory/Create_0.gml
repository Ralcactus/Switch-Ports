global.game_music = "bgm_micro_memory";
global.game_music_loops = true;
bg_y = 0;
alarm[0] = 1;
timer[0] = -1;

timer_func[0] = function()
{
    instance_create_micro(positions[coin], -303, "Over", obj_micro_cratememory_coin);
};

timer[1] = -1;

timer_func[1] = function()
{
    buster_in = true;
    timer[4] = 60;
};

crates_down = false;
buster_in = false;
timer[2] = -1;

timer_func[2] = function()
{
    if (swap_ind < array_length(swaps))
        event_user(0);
    else
        event_user(1);
};

timer[3] = -1;

timer_func[3] = function()
{
    splash = true;
    go = true;
};

timer[4] = -1;

timer_func[4] = function()
{
    if (buster_spr == spr_micro_cratememory_buster_pick)
    {
        buster_spr = spr_micro_cratememory_buster_rise;
        buster_ind = 0;
    }
    
    splash = false;
};

swap_ind = 0;
buster_spr = spr_micro_cratememory_buster_pick;
buster_ind = 0;
buster_y = 395;
percent_buster = 0;

event_animend_buster = function()
{
    var _spr = buster_spr;
    
    if (_spr == spr_micro_cratememory_buster_rise)
    {
        buster_spr = spr_micro_cratememory_buster_risehold;
        buster_ind = 0;
    }
    else if (_spr == spr_micro_cratememory_buster_smash)
    {
        event_user(2);
    }
};

splash_alpha = 0;
splash = false;
buster_x = 0;
selected = 1;
go = false;
smash = -4;
