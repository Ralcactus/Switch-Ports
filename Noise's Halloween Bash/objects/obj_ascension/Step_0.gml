if (place_meeting(x, y - 1, obj_player) && !playeron)
{
    playeron = true;
    obj_player.hit_vertical = -1;
    obj_player.hit_horizontal = -1;
    obj_player.step_vertical = -1;
    obj_player.step_horizontal = -1;
    obj_player.collide_destructibles = -1;
    obj_player.state = states.endplatform;
    obj_player.vsp = 0;
    instance_create_depth(0, 0, 0, obj_ascendprompt);
    instance_create_depth(obj_player.x, obj_player.y, obj_player.z, obj_ascendingplayer);
}

if (!place_meeting(x, y - 1, obj_player))
    playeron = false;
