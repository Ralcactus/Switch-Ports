if (sprite_index != spr_confectiboxopen)
{
    with (obj_creamThief)
    {
        hsp = 0;
        vsp = 0;
        state = UnknownEnum.Value_0;
        sprite_index = spr_creamthief_lose;
    }
    
    var _content = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), BoxContent);
    
    if (object_get_parent(_content.object_index) == obj_parent_confecti)
    {
        with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_mushroomCloudEffect))
        {
            sprite_index = spr_taunteffect;
            depth = -2;
        }
        
        event_play_oneshot("event:/SFX/general/collecttoppin");
        helptimer = -1;
        
        if (global.ToppinTotal < 5)
            scr_controlprompt("[spr_promptfont]You are missing " + string(5 - global.ToppinTotal) + " confecti!", -4, 200);
        else if (global.ToppinTotal == 5)
            scr_controlprompt("[spr_promptfont]You have found all 5 confecti!", -4, 200);
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 200;
        global.ToppinTotal += 1;
        global.Collect += 1000;
        global.ComboFreeze = 30;
        global.ComboTime = 60;
    }
    
    repeat (6)
        create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_confecticage_debris);
    
    instance_destroy();
    ds_list_add(global.SaveRoom, id);
}
