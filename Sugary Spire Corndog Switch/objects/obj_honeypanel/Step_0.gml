if (active && obj_parent_player.state != UnknownEnum.Value_155 && sprite_index != spr_honeypanel_regen)
    sprite_index = spr_honeypanel;

if (sprite_index == spr_honeypanel_dissapear && animation_end())
    sprite_index = spr_honeypanel_deactive;

if (sprite_index == spr_honeypanel_regen && animation_end())
    sprite_index = spr_honeypanel;

if (place_meeting(x, y, obj_parent_player))
    y -= movespeed;

if (place_meeting(x, y - 16, obj_solid))
{
    y = ystart;
    event_user(0);
    
    with (obj_parent_player)
    {
        if (state == UnknownEnum.Value_155)
            state = UnknownEnum.Value_1;
    }
}

if ((active == false && y != ystart) || (place_meeting(x, y, obj_parent_player) && obj_parent_player.state != UnknownEnum.Value_155))
    y = ystart;
