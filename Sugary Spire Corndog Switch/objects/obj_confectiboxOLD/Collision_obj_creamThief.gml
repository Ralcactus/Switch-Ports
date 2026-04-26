if (sprite_index != spr_confectiboxopen && other.state == UnknownEnum.Value_2)
{
    with (other)
    {
        sprite_index = spr_creamthief_grab;
        image_index = 0;
        state = UnknownEnum.Value_0;
    }
    
    with (obj_creamThiefLoseTrigger)
    {
        if (ds_list_find_index(global.SaveRoom, id) == -1)
            ds_list_add(global.SaveRoom, id);
        
        instance_destroy();
    }
    
    sprite_index = spr_confectiboxopen;
    image_index = 0;
    ds_list_add(global.SaveRoom, id);
}
