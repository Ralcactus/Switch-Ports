active = false;
time = 0;

if (ds_list_find_index(global.SaveRoom, id) != -1)
    instance_destroy();
