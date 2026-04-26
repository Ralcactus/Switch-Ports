function scr_pizzano_shoulderbash()
{
    hsp = xscale * movespeed;
    
    if (key_jump && grounded)
    {
        state = UnknownEnum.Value_123;
        vsp = -12;
    }
    
    if (xscale != 0)
    {
        if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
        {
            movespeed = -3.5;
            vsp = -8;
            machTwo = 0;
            state = UnknownEnum.Value_67;
            image_index = 0;
            machSlideAnim = true;
            instance_create(x + 10, y + 10, obj_bumpEffect);
        }
    }
    
    if (key_attack && grounded)
    {
        flash = true;
        state = UnknownEnum.Value_64;
        image_index = 0;
        sprite_index = spr_mach2;
        jumpStop = false;
    }
}
