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
        
        if (global.ToppinTotal < 5)
            obj_tv.message = "YOU ARE ONLY MISSING " + string(5 - global.ToppinTotal) + " CONFECTI!";
        else if (global.ToppinTotal == 5)
            obj_tv.message = "YOU GOT ALL CONFECTI!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 200;
        global.ToppinTotal += 1;
        global.Collect += 1000;
        global.ComboFreeze = 30;
        global.ComboTime = 60;
    }
    
    sprite_index = spr_confectiboxopen;
    image_index = 0;
    ds_list_add(global.SaveRoom, id);
}
