if (scr_map_exit_freeze())
    exit;

with (obj_map_player)
{
    if (instance_place_3d(x, y, z, other))
        event_hurt();
}

anim_logic();

if (crosswalk_stop)
    exit;

y += (movespd * global.delta_game_factor);
var _deac = instance_place_3d(x, y, z, obj_enemy_crossing_respawn);

if (_deac)
{
    if (bbox_bottom >= _deac.bbox_bottom)
    {
        y -= 1800;
        image_index = irandom_range(0, 2);
        
        if (image_index == 0)
            anim_play(spr_map_ball_d);
        else if (image_index == 1)
            anim_play(spr_map_lip_d);
        else if (image_index == 2)
            anim_play(spr_map_rodger_d);
        
        image_index = 0;
        instance_destroy();
    }
}
