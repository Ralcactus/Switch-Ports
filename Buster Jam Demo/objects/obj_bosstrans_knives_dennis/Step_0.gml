testvariablenothing = false;
bridget_ind += ((sprite_get_speed(bridget_spr) / 60) * global.delta_game_factor);
bridget_pupils_x = approach(bridget_pupils_x, bridget_pupils_x_to, 12);
timer_logic(0);
timer_logic(1);
dennis_ind += ((sprite_get_speed(dennis_spr) / 60) * global.delta_game_factor);
var _percent = dennis_percent;
dennis_percent = approach(dennis_percent, 1, 0.14285714285714285);
dennis_x = use_curve(acurv_linear, dennis_percent, undefined, dennis_xstart, dennis_pos[dennis_spot][0]);
dennis_y = use_curve(acurv_linear, dennis_percent, undefined, dennis_ystart, dennis_pos[dennis_spot][1]);

if (_percent < 1 && dennis_percent == 1)
{
    switch (dennis_spot)
    {
        case 0:
            dennis_spr = spr_bosstrans_knives_3_dennis_stab_UL;
            break;
        
        case 1:
            dennis_spr = spr_bosstrans_knives_3_dennis_stab_UR;
            break;
        
        case 2:
            dennis_spr = spr_bosstrans_knives_3_dennis_stab_BR;
            break;
        
        case 3:
            dennis_spr = spr_bosstrans_knives_3_dennis_stab_BL;
            break;
    }
    
    dennis_ind = 0;
}

shake = approach(shake, 0, 0.041666666666666664);
zoom = easy_smooth(zoom, 1, 3);
