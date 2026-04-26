function scr_pizzano_pummel()
{
    hsp = movespeed * xscale;
    movespeed = 12;
    
    if ((animation_end() && grounded) || move == -xscale)
        state = UnknownEnum.Value_1;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        state = UnknownEnum.Value_67;
        hsp = -2.5 * xscale;
        vsp = -3;
        machTwo = 0;
        image_index = 0;
        instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
    }
    
    if (key_down)
    {
        state = UnknownEnum.Value_62;
        sprite_index = spr_coneboy_slidekick;
    }
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (inputBufferJump > 0 && can_jump && !key_down)
    {
        jumpStop = false;
        image_index = 0;
        vsp = -11;
        inputBufferJump = 0;
    }
}
