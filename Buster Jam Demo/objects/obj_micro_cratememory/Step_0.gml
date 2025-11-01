timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);

if (crates_down)
{
    with (obj_micro_cratememory_crate)
    {
        if (ID == other.ID)
        {
            y = approach(y, 489, 6);
            
            if (y == 489 && other.timer[1] == -1)
            {
                other.timer[1] = 10;
                other.crates_down = false;
            }
        }
    }
}

if (buster_in)
{
    percent_buster = approach(percent_buster, 1, 0.042);
    buster_y = use_curve(acurv_linear, percent_buster, "out", buster_y, 0);
}

if (splash)
    splash_alpha = approach(splash_alpha, 1, 0.1);
else
    splash_alpha = approach(splash_alpha, 0, 0.1);

buster_xto = (selected - 1) * 384;
buster_x = easy_smooth(buster_x, buster_xto, 1.1, false);

if (go)
{
    var _xAxis = input_check_pressed("right", player) - input_check_pressed("left", player);
    
    if (_xAxis != 0)
    {
        var _before = selected;
        selected += _xAxis;
        
        if (selected < 0)
            selected = 0;
        
        if (selected > 2)
            selected = 2;
        
        if (selected != _before)
            audio_play_sound(snd_Bu_coin_step, 0, 0);
        
        if (buster_spr == spr_micro_cratememory_buster_pick)
        {
            buster_spr = spr_micro_cratememory_buster_rise;
            buster_ind = 0;
        }
    }
    
    if (input_check_pressed("jump") || controller.timer[0] <= (60 * time_bpm_to_seconds(140) * 1))
    {
        go = false;
        smash = selected;
        audio_play_sound(snd_Bu_defuse_fuseout, 0, 0);
        buster_spr = spr_micro_cratememory_buster_smash;
        buster_ind = 0;
    }
}
