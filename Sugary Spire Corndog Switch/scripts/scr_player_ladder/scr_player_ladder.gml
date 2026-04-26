function state_player_ladder()
{
    jumpAnim = true;
    landAnim = false;
    crouchAnim = false;
    turning = 0;
    jumpStop = false;
    movespeed = 0;
    hsp = 0;
    suplexMove = false;
    grav = 0;
    
    if (character != UnknownEnum.Value_1)
    {
        if (key_up)
        {
            sprite_index = spr_laddermove;
            
            if (vsp > -6)
                vsp = -6;
            
            image_speed = 0.35;
        }
        else if (key_down)
        {
            sprite_index = spr_ladderdown;
            
            if (vsp < 6)
                vsp = 6;
            
            image_speed = -0.35;
        }
        else
        {
            sprite_index = spr_Ladder;
            vsp = 0;
        }
    }
    else if (key_up)
    {
        if (sprite_index == spr_player_PN_ladder_idle_2)
            image_index = 7;
        else if (sprite_index == spr_player_PN_ladder_idle_1)
            image_index = 0;
        
        sprite_index = spr_laddermove;
        vsp = -6;
        image_speed = 0.35;
    }
    else if (key_down)
    {
        if (sprite_index == spr_player_PN_ladder_idle_2)
            image_index = 6;
        else if (sprite_index == spr_player_PN_ladder_idle_1)
            image_index = 12;
        
        sprite_index = spr_player_PN_ladder_down;
        vsp = 6;
        image_speed = 0.35;
    }
    else
    {
        if (sprite_index == spr_player_PN_ladder_up)
        {
            if (image_index > 3 && image_index < 10)
                sprite_index = spr_player_PN_ladder_idle_2;
            else if (sprite_index != spr_player_PN_ladder_idle_1)
                sprite_index = spr_player_PN_ladder_idle_1;
        }
        else if (sprite_index == spr_player_PN_ladder_down)
        {
            if (image_index > 2 && image_index < 8)
                sprite_index = spr_player_PN_ladder_idle_2;
            else if (sprite_index != spr_player_PN_ladder_idle_1)
                sprite_index = spr_player_PN_ladder_idle_1;
        }
        
        vsp = 0;
    }
    
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    
    if (!place_meeting(x, y, obj_ladder))
    {
        landAnim = false;
        jumpAnim = false;
        state = UnknownEnum.Value_1;
        image_index = 0;
        vsp = 0;
    }
    
    if (inputBufferJump > 0)
    {
        fmod_event_play(sndJump);
        inputBufferJump = 0;
        sprite_index = spr_jump;
        image_index = 0;
        ladderBuffer = 20;
        jumpAnim = true;
        state = UnknownEnum.Value_55;
        vsp = -9;
    }
    
    if (key_down && scr_solid_player(x, y + 1))
    {
        state = UnknownEnum.Value_1;
        image_index = 0;
    }
}
