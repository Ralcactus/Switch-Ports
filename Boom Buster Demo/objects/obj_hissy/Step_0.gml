event_inherited();
timer_logic(0);

if (state == state_prep)
{
    if (collision_rectangle(bbox_right, bbox_top - 256, bbox_right + 512, bbox_bottom + 256, obj_player, false, false))
        facing = 1;
    else if (collision_rectangle(bbox_left - 512, bbox_top - 256, bbox_left, bbox_bottom + 256, obj_player, false, false))
        facing = -1;
}
