if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_baddieDead))
        sprite_index = spr_lemonheadblockdead;
    
    ds_list_add(global.SaveRoom, id);
}

if (instance_exists(solidid))
{
    with (solidid)
        instance_destroy();
}
