if (scr_map_exit_freeze())
    exit;

x += (hspd * global.delta_game_factor);

if (place_meeting(x, y, obj_boomtown_car_destroyer))
    instance_destroy();

anim_logic();
