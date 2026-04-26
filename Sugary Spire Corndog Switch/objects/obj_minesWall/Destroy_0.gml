if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    instance_create(x, y, obj_bombExplosionHarmless);
    
    repeat (5)
    {
        for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
        {
            with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_gnomewalldebris))
                image_index = i;
        }
    }
}

ds_list_add(global.SaveRoom, id);
