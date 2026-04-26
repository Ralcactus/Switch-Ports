function state_player_bombpep()
{
    if (sprite_index == spr_player_PZ_bomb_intro || sprite_index == spr_player_PZ_bomb_end)
        mask_index = spr_crouchmask;
    else
        mask_index = spr_player_mask;
    
    if (place_meeting(x, y, obj_watertop))
        bombPepTimer = 0;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    machTwo = 0;
    landAnim = false;
    scr_getinput();
    alarm[5] = 2;
    
    if (sprite_index == spr_player_PZ_bomb_intro && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_PZ_bomb_run;
    
    if (sprite_index == spr_player_PZ_bomb_run || sprite_index == spr_player_PZ_bomb_run_flashing)
    {
        if (movespeed <= 8)
            movespeed += 0.2;
        
        hsp = floor(xscale * movespeed);
    }
    else
    {
        hsp = 0;
        movespeed = 0;
    }
    
    if (bombPepTimer < 20 && bombPepTimer != 0)
        sprite_index = spr_player_PZ_bomb_run_flashing;
    
    if (sprite_index == spr_player_PZ_bomb_end && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2;
        alarm[7] = 60;
        hurted = true;
        state = UnknownEnum.Value_1;
        sprite_index = spr_player_PZ_idle;
        image_index = 0;
    }
    
    if (bombPepTimer <= 0 && sprite_index == spr_player_PZ_bomb_run_flashing)
    {
        event_play_oneshot("event:/SFX/general/explosion", x, y);
        hurted = true;
        instance_create(x, y, obj_bombExplosion);
        sprite_index = spr_player_PZ_bomb_end;
    }
    
    if (bombPepTimer > 0)
        bombPepTimer -= 0.5;
    
    if (scr_solid(x + 1, y) && xscale == 1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_bombblock) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
    {
        instance_create(x + 10, y + 10, obj_bumpEffect);
        xscale *= -1;
    }
    
    if (scr_solid(x - 1, y) && xscale == -1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_bombblock) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
    {
        instance_create(x - 10, y + 10, obj_bumpEffect);
        xscale *= -1;
    }
    
    if (inputBufferJump > 0 && can_jump && hsp != 0)
    {
        vsp = -9;
        inputBufferJump = 0;
    }
    
    if (movespeed < 4)
        image_speed = 0.35;
    else if (movespeed > 4 && movespeed < 8)
        image_speed = 0.45;
    else
        image_speed = 0.6;
    
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && !steppy && grounded)
        steppy = true;
    
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = false;
    
    if (!instance_exists(obj_dashCloud) && grounded && hsp != 0)
        instance_create(x, y, obj_dashCloud);
}
