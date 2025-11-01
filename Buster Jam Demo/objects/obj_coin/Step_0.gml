if (scr_map_exit_freeze())
    exit;

mask_index = spr_map_coin_mask;

with (obj_map_player)
    mask_index = spr_player_mask_3d_collect;

if (instance_place_3d(x, y, z, obj_map_player))
    event_user(0);

with (obj_map_player)
    mask_index = spr_player_mask_3d;

z += vspd;
vspd += grav;
anim_logic();
timer_logic(0);
depth_pos = -bbox_bottom;

if (collected)
    anim_speed += 0.1;
