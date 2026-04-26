function state_player_donut()
{
    landAnim = false;
    hsp = xscale * movespeed;
    
    if (grounded)
        movespeed = approach(movespeed, 0, 0.1);
    
    sprite_index = spr_player_PZ_donut_throw;
    
    if (animation_end())
    {
        if (key_attack && movespeed >= 10)
        {
            state = UnknownEnum.Value_64;
        }
        else if (scr_solid(x, y - 3))
        {
            state = UnknownEnum.Value_60;
            landAnim = false;
            image_index = 0;
            idle = 0;
        }
        else
        {
            state = UnknownEnum.Value_1;
            image_index = 0;
        }
    }
    
    image_speed = 0.4;
}
