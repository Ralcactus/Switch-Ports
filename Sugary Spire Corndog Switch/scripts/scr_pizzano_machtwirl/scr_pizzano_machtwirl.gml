function scr_pizzano_machtwirl()
{
    sprite_index = spr_player_PN_machTwirl;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    machTwo++;
    
    if (move != 0)
    {
        if (move == xscale && movespeed < 11)
            movespeed += 0.75;
        else if (move != xscale && movespeed > -11)
            movespeed -= 0.75;
    }
    
    if (key_down2 && !grounded)
        vsp = max(vsp, 10);
    
    if (!key_jump2)
        vsp = max(vsp, -4);
    
    if (grounded)
    {
        if (key_attack)
        {
            state = UnknownEnum.Value_64;
            image_index = 0;
            jumpStop = false;
        }
        else
        {
            state = UnknownEnum.Value_1;
            image_index = 0;
            machTwo = 0;
            jumpStop = false;
        }
    }
    
    var jump_bad = instance_place(x, y + vsp, obj_parent_baddie);
    
    if (jump_bad)
    {
        instance_destroy(jump_bad);
        vsp = -10;
    }
    
    do_grab();
    
    if (key_attack && (!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        verticalMovespeed = movespeed;
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            verticalMovespeed -= round(vsp * 1.25);
        else if (vsp > 0 && character == UnknownEnum.Value_1)
            verticalMovespeed -= vsp;
        
        grabClimbBuffer = 0;
        inputBufferJump = 0;
        state = UnknownEnum.Value_11;
    }
}
