testvariablenothing = false;
event_inherited();
draw_me = true;
anim_init();
bridget_spr = spr_bosstrans_knives_3_bridget_down;
bridget_ind = 0;
bridget_pupils_x = 0;
bridget_pupils_x_to = 0;
bridget_shake = 0;
dennis_spr = spr_bosstrans_knives_3_dennis_stab_UL;
dennis_ind = 0;
dennis_x = 800;
dennis_y = 400;
dennis_pos[0] = [848, 458];
dennis_pos[1] = [181, 532];
dennis_pos[2] = [100, 54];
dennis_pos[3] = [786, 55];
dennis_spot = 0;
dennis_x = dennis_pos[dennis_spot][0];
dennis_y = dennis_pos[dennis_spot][1];
dennis_percent = 0;
dennis_xstart = dennis_x;
dennis_ystart = dennis_y;
timer[0] = time_bpm_to_seconds(140) * 60 * 1.5;

timer_func[0] = function()
{
    dennis_xstart = dennis_x;
    dennis_ystart = dennis_y;
    dennis_percent = 0;
    dennis_spot++;
    
    if (dennis_spot > 3)
        dennis_spot = 0;
    
    if (dennis_spot == 1)
    {
        bridget_pupils_x_to = -30;
        dennis_spr = spr_bosstrans_knives_3_dennis_run_left;
        dennis_ind = 0;
    }
    else if (dennis_spot == 2)
    {
        bridget_spr = spr_bosstrans_knives_3_bridget_turn_left;
        bridget_ind = 0;
        timer[1] = 3;
        dennis_spr = spr_bosstrans_knives_3_dennis_run_up;
        dennis_ind = 0;
        bridget_pupils_x_to = 0;
    }
    else if (dennis_spot == 0)
    {
        bridget_spr = spr_bosstrans_knives_3_bridget_turn_right;
        bridget_ind = 0;
        dennis_spr = spr_bosstrans_knives_3_dennis_run_down;
        dennis_ind = 0;
        timer[1] = 3;
    }
    else if (dennis_spot == 3)
    {
        dennis_spr = spr_bosstrans_knives_3_dennis_run_right;
        dennis_ind = 0;
    }
    
    timer[0] = time_bpm_to_seconds(140) * 60 * 1.5;
};

timer[1] = -1;

timer_func[1] = function()
{
    var _spr = bridget_spr;
    
    if (_spr == spr_bosstrans_knives_3_bridget_turn_left)
    {
        bridget_spr = spr_bosstrans_knives_3_bridget_up;
        bridget_ind = 0;
        bridget_shake = 1;
    }
    else if (_spr == spr_bosstrans_knives_3_bridget_turn_right)
    {
        bridget_spr = spr_bosstrans_knives_3_bridget_down;
        bridget_ind = 0;
        bridget_shake = 1;
    }
};

hp_x = 1216;
hp_y = 992;
score_x = 1504;
score_y = 160;
zoom = 1;
shake = 0;
