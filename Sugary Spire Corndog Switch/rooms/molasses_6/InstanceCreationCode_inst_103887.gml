condition = function()
{
    return !instance_exists(103783);
};

output = function()
{
    with (103759)
    {
        if (!(ds_list_find_index(global.SaveRoom, id) != -1))
        {
            instance_create(x, y, obj_puffEffect);
            
            repeat (3)
                instance_create(x + random_range(-5, 5), y + random_range(-5, 5), obj_puffEffect);
            
            instance_destroy();
        }
    }
    
    with (103760)
    {
        if (!(ds_list_find_index(global.SaveRoom, id) != -1))
        {
            instance_create(x, y, obj_puffEffect);
            
            repeat (3)
                instance_create(x + random_range(-5, 5), y + random_range(-5, 5), obj_puffEffect);
            
            instance_destroy();
        }
    }
    
    with (103829)
    {
        if (!(ds_list_find_index(global.SaveRoom, id) != -1))
        {
            instance_create(x, y, obj_puffEffect);
            
            repeat (3)
                instance_create(x + random_range(-5, 5), y + random_range(-5, 5), obj_puffEffect);
            
            instance_destroy();
        }
    }
};
