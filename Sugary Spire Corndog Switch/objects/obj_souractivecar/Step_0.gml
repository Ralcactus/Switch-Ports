if (sprite_index != spr_souractivecaractive)
{
    if (((place_meeting(x, y - obj_parent_player.vsp, obj_parent_player) || place_meeting(x, y - 1, obj_parent_player)) && (obj_parent_player.state == UnknownEnum.Value_70 || (obj_parent_player.state == UnknownEnum.Value_122 && obj_parent_player.vsp > 0))) || (distance_to_object(obj_parent_player) <= 400 && obj_parent_player.state == UnknownEnum.Value_42))
    {
        if (instance_exists(obj_sourenemyspawn))
        {
            with (obj_sourenemyspawn)
                rising = true;
        }
        
        sprite_index = spr_souractivecaractive;
    }
}
