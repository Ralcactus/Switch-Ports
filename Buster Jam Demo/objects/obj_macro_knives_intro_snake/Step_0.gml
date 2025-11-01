testvariablenothing = false;
anim_logic();
timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);
anim_index_bridget += ((sprite_get_speed(anim_sprite_bridget) / 60) * global.delta_game_factor);

if (anim_index_bridget >= sprite_get_number(anim_sprite_bridget))
{
    var _loop = true;
    var _spr = anim_sprite_bridget;
    
    if (_spr == spr_macro_knives_bridget_wrap_scream0)
    {
        anim_index_bridget = 0;
        anim_sprite_bridget = spr_macro_knives_bridget_wrap_scream1;
        _loop = false;
        shake_screen = 0.25;
    }
    else if (_spr == spr_macro_knives_bridget_wrap_scream1)
    {
        anim_index_bridget = 1;
        _loop = false;
    }
    
    if (_loop)
        anim_index_bridget -= anim_index_bridget;
}

if (move_out)
{
    hspd = approach(hspd, 50, 1.6666666666666667);
    x += (hspd * global.delta_game_factor);
    shake_screen = approach(shake_screen, 0, 0.01);
    get_cams();
    
    if (x > (camx + 3840))
        instance_destroy();
}

if (move_in)
    x = easy_smooth(x, (obj_macro_knives_controller.intro_zoom * 1920) - 530, 15);

if (arm_in)
    arm_x = easy_smooth(arm_x, 0, 12);

get_cams();
y = camy - (45 * obj_macro_knives_controller.zoom);
obj_macro_knives_controller.shake = shake_screen;
