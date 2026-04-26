repeat (irandom_range(4, 7))
{
    summonedDust = true;
    
    with (instance_create(x + random_range(-100, 100), y + random_range(-100, 100), obj_machDustEffect))
    {
        sprite_index = spr_smogPuff;
        image_index = 0;
    }
}
