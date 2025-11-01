testvariablenothing = false;
anim_logic();

if (cutscene_move)
{
    if (move_lerp)
        percent_move = easy_smooth(percent_move, 1, move_lerp_lag);
    else
        percent_move = approach(percent_move, 1, move_shift);
    
    x = use_curve(acurv_linear, percent_move, undefined, move_xstart, xto);
    y = use_curve(acurv_linear, percent_move, undefined, move_ystart, yto);
    
    if (x == xto && y == yto && !finished)
    {
        if (unpause_when_done)
        {
            with (par_map_cutscene)
            {
                paused = false;
                event_continue();
            }
        }
        
        finished = true;
        move_jump = false;
        shift_override = false;
    }
}

zspd += (grav * global.delta_game_factor);
physics_apply_3d();
grounded = instance_place_3d(x, y, z + 1, obj_solid);
scr_shadow_z();
shake = approach(shake, 0, 0.1);

if (global.debug && keyboard_check_pressed(ord("1")))
    shake = 1;
