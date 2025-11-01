if (scr_map_exit_freeze())
    exit;

zspd += (grav * global.delta_game_factor);
z += (zspd * global.delta_game_factor);
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
var _dist = x - xstart;

if (_dist >= (975 * mult))
{
    with (my_player)
        event_win();
    
    screen_shake(7, 7, 0.36);
    
    with (obj_map_frenzy_controller)
        zoom = zoom_normal - 0.03;
    
    with (obj_boomtown_wizardstatue)
        event_hit();
    
    instance_destroy();
}

anim_logic();
