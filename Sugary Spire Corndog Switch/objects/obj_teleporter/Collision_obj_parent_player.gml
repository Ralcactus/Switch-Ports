if (!reciever && !active && obj_parent_player.state != UnknownEnum.Value_111 && !global.freezeframe && is_for_me)
{
    alarm[0] = 25;
    active = true;
    
    with (obj_parent_player)
    {
        visible = false;
        other.storedstate = state;
        other.storedmovespeed = movespeed;
        other.storedgrav = grav;
        other.storedimageindex = image_index;
        other.storedspriteindex = sprite_index;
        other.storedfreefallsmash = freeFallSmash;
        hsp = 0;
        vsp = 0;
        grav = 0;
        alarm[7] = 50;
        alarm[5] = 2;
        hurted = true;
        state = UnknownEnum.Value_111;
    }
}
