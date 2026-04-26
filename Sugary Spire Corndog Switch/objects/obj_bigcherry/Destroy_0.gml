if (ds_list_find_index(global.BaddieRoom, id) == -1)
{
    var player_hsp = (obj_parent_player.state != UnknownEnum.Value_0) ? obj_parent_player.hsp : obj_parent_player.frozenHsp;
    
    if (thrown)
    {
        with (instance_create(x, y, obj_bombexplosionconeboy))
            frog = true;
    }
    else if (place_meeting(x, y, obj_parent_player))
    {
        with (instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = clamp(abs(player_hsp) + 4, 8, 24);
            image_xscale = sign(obj_parent_player.xscale);
        }
    }
    else if (place_meeting(x, y, obj_gigacherrydead))
    {
        var iceblock = instance_place(x, y, obj_gigacherrydead);
        
        with (instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = clamp(abs(iceblock.hsp) + 4, 8, 24);
            image_xscale = sign(iceblock.image_xscale);
        }
    }
    else
    {
        with (instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = 8;
            image_xscale = -sign(other.image_xscale);
        }
    }
}

event_inherited();
