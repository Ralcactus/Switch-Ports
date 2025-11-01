event_inherited();

if (collision_rectangle_3d(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, z, height, obj_map_player, true, true))
    event_user(0);
