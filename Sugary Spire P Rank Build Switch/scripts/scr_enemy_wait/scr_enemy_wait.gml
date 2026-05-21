function scr_enemy_panicWait()
{
    visible = false;
    hsp = 0;
    vsp = 0;
    x = -900;
    y = -200;
    invincible = true;
    
    if (global.panic)
    {
        var _player = instance_nearest(xstart, ystart, obj_player);
        
        if (!instance_exists(escapePortal) && point_in_rectangle(xstart, ystart, _player.x - 500, obj_player.y - 100, obj_player.x + 500, obj_player.y + 100))
        {
            escapePortal = instance_create(xstart, ystart, obj_panicPortal);
            instance_create(xstart, ystart, obj_poofeffect);
            x = xstart;
            y = ystart;
            squashedx = true;
            squashvalx = 0;
            stunned = 20;
            
            if (!scr_enemyDestroyableCheck(x, y))
            {
                invincible = false;
                visible = true;
                flash = true;
                state = baddiestate.stun;
                sprite_index = stunfallspr;
                image_index = 0;
            }
        }
    }
}

function scr_enemy_secretWait()
{
    visible = false;
    hsp = 0;
    vsp = 0;
    x = -900;
    y = -200;
    invincible = true;
    
    if (!place_meeting(xstart, ystart, obj_bigdestructibles))
    {
        x = xstart;
        y = ystart;
        visible = true;
        secretjumped = true;
        squashedx = true;
        squashvalx = 0;
        stunned = 3;
        vsp = -8;
        state = baddiestate.stun;
        sprite_index = walkspr;
    }
}

function scr_enemyDestroyableCheck(xx = xstart, yy = ystart)
{
    if (place_meeting(xx, yy, obj_bigdestructibles))
    {
        xstart = xx;
        ystart = yy;
        state = baddiestate.secretwait;
        return true;
    }
    
    return false;
}
