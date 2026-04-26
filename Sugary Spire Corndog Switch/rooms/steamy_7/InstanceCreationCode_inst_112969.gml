flags.do_save = false;

condition = function()
{
    var _check = false;
    
    with (obj_parent_player)
    {
        if (place_meeting(roomStartX, roomStartY, other))
            _check = true;
    }
    
    return _check;
};

output = function()
{
    obj_camera.chargeCameraX = 0;
    obj_parent_player.movespeed = 5;
    perma = true;
    event_perform_object(obj_puddle, ev_other, ev_user0);
};
