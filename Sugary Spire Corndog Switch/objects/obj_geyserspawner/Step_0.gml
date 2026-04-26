if ((place_meeting(x, y - obj_parent_player.vsp, obj_parent_player) || place_meeting(x, y - 1, obj_parent_player)) && obj_parent_player.state == UnknownEnum.Value_70)
{
    if (!instance_exists(SpoutID))
    {
        with (instance_create(x, y, obj_geyservertical))
        {
            image_xscale = other.image_xscale;
            geysertimer = 300;
            other.SpoutID = id;
        }
    }
}

Imageindex += 0.35;
