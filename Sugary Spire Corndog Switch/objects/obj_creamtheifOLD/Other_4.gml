if (ds_list_find_index(global.BaddieRoom, id) != -1)
    instance_destroy();

if (ds_list_find_index(global.SaveRoom, id) != -1)
{
    thiefKeyInv = true;
    ds_list_delete(global.SaveRoom, ds_list_find_index(global.SaveRoom, id));
}

if (panicEscape)
    state = UnknownEnum.Value_11;
