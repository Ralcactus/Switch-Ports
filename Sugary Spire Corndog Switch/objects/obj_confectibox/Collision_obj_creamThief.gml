if (sprite_index != spr_confectiboxopen && other.state == UnknownEnum.Value_2)
{
    helptimer = -1;
    
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
    
    var snd_id = event_play_oneshot("event:/SFX/general/collecttoppin");
    fmod_event_setPitch(snd_id, 0.8);
    
    repeat (6)
        create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_confecticage_debris);
    
    instance_destroy();
    ds_list_add(global.SaveRoom, id);
}
