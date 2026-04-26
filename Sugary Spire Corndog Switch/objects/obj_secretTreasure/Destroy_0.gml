if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    with (instance_create(x, y, obj_treasureparticle))
        sprite_index = other.sprite_index;
    
    ds_list_add(global.SaveRoom, id);
}
