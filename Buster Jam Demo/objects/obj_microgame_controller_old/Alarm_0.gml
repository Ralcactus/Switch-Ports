if (!out)
{
    if (texture_group != -4)
        texture_group_load = texture_prefetch(texture_group);
}
else
{
    if (texture_group != -4)
    {
        var _unload = false;
        
        with (obj_microgame_controller)
        {
            if (!ended)
                _unload = false;
        }
        
        if (_unload)
            texturegroup_unload(texture_group);
    }
    
    instance_destroy();
}
