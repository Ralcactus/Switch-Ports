flags.do_once_per_save = true;

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
    with (103621)
    {
        sprite_index = spr_geyserCutscene_Active;
        image_index = 0;
    }
};
