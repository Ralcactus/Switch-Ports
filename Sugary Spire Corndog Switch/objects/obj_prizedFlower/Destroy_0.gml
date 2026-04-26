if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    with (obj_beefarmer)
    {
        sprite_index = spr_beefarmer_sing;
        image_index = 0;
        state = UnknownEnum.Value_3;
        alarm[0] = singLength;
        alarm[1] = -1;
    }
    
    with (obj_flowerBlock)
        instance_destroy();
    
    ds_list_add(global.SaveRoom, id);
}
