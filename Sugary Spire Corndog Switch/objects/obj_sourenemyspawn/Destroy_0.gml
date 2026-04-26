if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    instance_create(x, y, content);
    ds_list_add(global.SaveRoom, id);
}
