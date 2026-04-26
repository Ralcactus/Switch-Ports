fmod_quick3D(sndMoving);

if (!event_isplaying(sndMoving))
    fmod_event_play(sndMoving);

if (image_alpha >= 1)
{
    var dir = point_direction(x, y, obj_parent_player.x, obj_parent_player.y);
    
    if (!global.freezeframe)
    {
        x = approach(x, obj_parent_player.x, lengthdir_x(8, dir));
        y = approach(y, obj_parent_player.y, lengthdir_y(8, dir));
    }
}
else
{
    image_alpha += 0.01;
}

var pid = instance_place(x, y, obj_parent_player);

if (pid > 0 && !pid.cutscene && !instance_exists(obj_fadeoutTransition) && !instance_exists(obj_endlevelfade) && image_alpha >= 1)
{
    with (pid)
    {
        instance_destroy(obj_fadeoutTransition);
        targetDoor = "A";
        global.panic = 0;
        global.greyscalefade = 0;
        room = timesuproom;
        state = UnknownEnum.Value_27;
        sprite_index = spr_Timesup;
        image_index = 0;
        event_play_oneshot("event:/music/timesup");
    }
    
    instance_destroy();
}
