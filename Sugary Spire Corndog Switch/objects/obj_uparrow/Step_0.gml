image_speed = 0.2;

with (obj_parent_player)
{
    if ((!place_meeting(x, y, obj_door) && (!place_meeting(x, y, obj_startgate) || state == UnknownEnum.Value_56) && !place_meeting(x, y, obj_keydoorclock) && !place_meeting(x, y, obj_janitorDoor) && !place_meeting(x, y, obj_keydoor) && !place_meeting(x, y, obj_exitgate)) || !grounded || state != UnknownEnum.Value_1)
        instance_destroy(other.id);
}

x = obj_parent_player.x;
y = obj_parent_player.y - 50;
