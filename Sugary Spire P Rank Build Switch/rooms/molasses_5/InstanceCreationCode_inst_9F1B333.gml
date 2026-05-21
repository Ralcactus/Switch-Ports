flags.do_once_per_save = true;

condition = function()
{
    var _check = false;
    
    with (obj_player)
    {
        if (place_meeting(roomstartx, roomstarty, other))
            _check = true;
    }
    
    return _check;
};

output = function()
{
    with (inst_4CD0885E)
    {
        sprite_index = spr_geyserCutscene_Active;
        image_index = 0;
    }
};
