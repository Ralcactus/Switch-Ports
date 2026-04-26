function state_player_timesup()
{
    xscale = 1;
    sprite_index = spr_Timesup;
    alarm[5] = -1;
    alarm[7] = -1;
    alarm[8] = -1;
    
    if (place_meeting(x, y, obj_timesup))
    {
        state = UnknownEnum.Value_27;
        sprite_index = spr_player_PZ_fall_outOfControl;
        state = UnknownEnum.Value_49;
        sprite_index = spr_deathend;
        alarm[10] = 5;
        vsp = -8;
        hsp = -4;
    }
    
    if (room == timesuproom)
    {
        obj_parent_player.x = 480;
        obj_parent_player.y = 270;
    }
    
    image_speed = (floor(image_index) >= 15 || room != timesuproom) ? 0 : 0.35;
}
