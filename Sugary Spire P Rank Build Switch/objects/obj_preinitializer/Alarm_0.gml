if (ds_exists(textureLoaderList, ds_type_list))
{
    if (!ds_list_empty(textureLoaderList))
    {
        var tex = ds_list_find_value(textureLoaderList, 0);
        
        for (var i = 0; i < array_length(tex); i++)
        {
            if (!texture_is_ready(tex[i]))
                texture_prefetch(tex[i]);
        }
        
        ds_list_delete(textureLoaderList, 0);
    }
    else
    {
        ds_list_destroy(textureLoaderList);
        room_goto(rm_initializer);
    }
}

for (var i = 0; sprite_exists(i); i++)
    sprite_prefetch(i);

alarm[0] = 2;
