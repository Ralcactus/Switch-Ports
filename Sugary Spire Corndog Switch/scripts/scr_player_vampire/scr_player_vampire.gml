function state_player_vampire()
{
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
        faceHurt = false;
    }
    
    move = key_left + key_right;
    
    if (grounded)
    {
        vampireJumps = 0;
        
        if (key_jump)
        {
            image_index = 0;
            sprite_index = spr_jump;
            fmod_event_play(sndJump);
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            vsp = -11;
            vampireJumps++;
        }
        else if (inputBufferSlap > 0 && !key_down && !suplexMove)
        {
            instance_create(x, y, obj_vampireBiteHitbox);
            suplexMove = true;
            vsp = 0;
            instance_create(x, y, obj_jumpdust);
            image_index = 0;
            sprite_index = spr_suplexdash;
            movespeed = 8 + (min(vampireBlood, 8) * 1.5);
        }
        else
        {
            movespeed = approach(movespeed, 5 + min(vampireBlood, 8), 1);
        }
    }
    else if (inputBufferSlap > 0 && !key_down && !suplexMove)
    {
        instance_create(x, y, obj_vampireBiteHitbox);
        suplexMove = true;
        vsp = 0;
        instance_create(x, y, obj_jumpdust);
        image_index = 0;
        sprite_index = spr_suplexdash;
        movespeed = 8 + (min(vampireBlood, 8) * 1.5);
    }
    else
    {
        if (key_jump && vampireJumps < 5)
        {
            vsp = min(vsp, -13 + (vampireJumps * 2));
            vampireJumps++;
        }
        
        movespeed = approach(movespeed, 5 + min(vampireBlood, 8), 0.5);
    }
    
    if (move != 0)
        xscale = move;
    
    hsp = move * movespeed;
}
