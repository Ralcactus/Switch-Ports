function scr_pizzano_twirl()
{
    sprite_index = spr_player_PN_twirl;
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
        }
        else
        {
            state = UnknownEnum.Value_1;
            machTwo = 0;
        }
        
        image_index = 0;
        jumpStop = false;
    }
    
    var jumpbad = instance_place(x, y + vsp, obj_parent_baddie);
    
    if (jumpbad)
    {
        instance_destroy(jumpbad);
        vsp = -10;
    }
    
    if (inputBufferSlap > 0)
    {
        inputBufferSlap = 0;
        
        if (charged && !key_up)
        {
            if (key_up)
            {
                alarm[0] = 240;
                state = UnknownEnum.Value_58;
                sprite_index = spr_player_PN_superJump_prep;
            }
            else
            {
                state = UnknownEnum.Value_103;
                sprite_index = spr_player_PN_sideSuperJump_prep;
                movespeed /= 1.5;
                machTwo = 0;
                charged = false;
                fmod_event_setParameter(sndSuperjump, "state", 0, true);
                fmod_event_play(sndSuperjump);
            }
            
            flash = true;
            image_index = 0;
        }
        else
        {
            fmod_event_play(sndKungFu);
            movespeed = max(movespeed, 9);
            kungTime = 30;
            state = UnknownEnum.Value_105;
            flash = true;
            
            if (grounded)
            {
                sprite_index = choose(spr_player_PN_kungfu_1, spr_player_PN_kungfu_2, spr_player_PN_kungfu_3, spr_player_PN_kungfu_4, spr_player_PN_kungfu_5);
                
                if (!instance_exists(obj_superdashcloud))
                {
                    instance_create(x, y, obj_superdashcloud, 
                    {
                        playerID: id
                    });
                }
            }
            else
            {
                sprite_index = choose(spr_player_PN_kungfuAir_1_intro, spr_player_PN_kungfuAir_2_intro, spr_player_PN_kungfuAir_3_intro);
            }
            
            instance_create(x, y, obj_crazyRunHoopEffect);
            p1Vibration(30, 5);
            image_index = 0;
        }
    }
    
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
