with (other)
{
    if (!is_undefined(scr_transformationCheck(state)))
    {
        state = UnknownEnum.Value_1;
        
        if (key_attack)
        {
            if (abs(movespeed) < 10)
                movespeed = 10;
            else
                movespeed = abs(movespeed);
            
            state = UnknownEnum.Value_64;
        }
        
        sprite_index = spr_idle;
        instance_create(x, y, obj_poofeffect);
        image_index = 0;
    }
}
