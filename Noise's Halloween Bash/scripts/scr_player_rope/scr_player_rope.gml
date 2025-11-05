function scr_player_rope()
{
    if (!instance_exists(ropeID))
    {
        state = states.normal;
        ropeID = noone;
        exit;
    }
    
    move = input_check_opposing("left", "right");
    
    if (move != 0)
    {
        image_xscale = move;
        sprite_index = spr_player_ropeswing;
    }
    else
        sprite_index = spr_player_rope;
    
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    landanim = 0;
    
    if (hovertime > 0)
        obj_drawcontroller.hovertimerflash = 1;
    
    hovertime = 0;
    hovered = 0;
    var _xoff = lengthdir_x(ropeID.sprite_height, ropeID.image_angle - 90);
    var _yoff = lengthdir_y(ropeID.sprite_height, ropeID.image_angle - 90);
    _yoff += (40 * abs(angle_difference(0, ropeID.image_angle) / 180));
    _xoff += ((50 * angle_difference(0, ropeID.image_angle)) / 180);
    x = ropeID.x + _xoff;
    y = ropeID.y + _yoff;
    
    if (jumpbuffer > 0)
    {
        jumpbuffer = 0;
        jumpnum = max(jumpnum, 1);
        ropeID.touchbuff = 60;
        vsp = -12;
        hsp = 0;
        
        while (scr_solid(x, y))
            y--;
        
        if (input_check("dash") && move != 0)
        {
            movespeed = 12;
            state = states.sprintjump;
            sprite_index = spr_player_secondjump;
            image_index = 5;
        }
        else
        {
            if (move != 0)
                movespeed = 6;
            
            state = states.jump;
            sprite_index = spr_player_jump;
            image_index = 0;
            
            if (instance_exists(obj_playercape))
                obj_playercape.sprite_index = spr_player_capeup;
        }
        
        scr_fmod_soundeffect(jumpsnd, x, y);
        hsp = movespeed * image_xscale;
        obj_drawcontroller.interpplaypos = true;
    }
    
    image_speed = 0.35;
}
