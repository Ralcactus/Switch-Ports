function cutscene_lapPortal_start()
{
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        sprite_index = spr_lappingportal_enter;
        image_speed = 0.35;
        
        if (animation_end())
            finished = true;
    }
    
    if (finished)
    {
        global.lapcount++;
        global.Collect += 3000;
        global.ComboTime = 60;
        var time = scr_laptimes();
        show_debug_message(string("Lap Time: {0}", string(time[0]) + ":" + string(time[1])));
        
        for (var i = 0; i < ds_list_size(global.EscapeRoom); i++)
        {
            var b = ds_list_find_value(global.EscapeRoom, i);
            var q = ds_list_find_index(global.BaddieRoom, b);
            var t = false;
            
            if (q == -1)
            {
                q = ds_list_find_index(global.SaveRoom, b);
                t = true;
            }
            
            if (q != -1)
            {
                if (!t)
                    ds_list_delete(global.BaddieRoom, q);
                else
                    ds_list_delete(global.SaveRoom, q);
            }
        }
        
        ds_list_clear(global.EscapeRoom);
        
        if (!instance_exists(obj_fadeoutTransition))
        {
            event_play_oneshot("event:/SFX/general/door");
            instance_create(0, 0, obj_fadeoutTransition);
        }
        
        cutscene_event_end();
    }
}

function cutscene_lapPortal_middle()
{
    static portal = -4;
    
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        visible = false;
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        sprite_index = spr_bodyslamfall;
        image_speed = 0.35;
        
        if (!instance_exists(obj_fadeoutTransition))
        {
            if (!instance_exists(portal))
                portal = instance_create(x, y + 14, obj_lapPortalexit);
            else if (floor(portal.image_index) >= 4)
                finished = true;
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_lapPortal_end()
{
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        visible = true;
        hsp = 0;
        vsp = 0;
        movespeed = 0;
        sprite_index = spr_bodyslamfall;
        state = UnknownEnum.Value_69;
        finished = true;
        
        if (!instance_exists(obj_lapjanitor))
        {
            instance_create(x, y, obj_lapjanitor);
            scr_queue_tvanim(spr_pizzytvjanitor2, 150);
        }
    }
    
    if (finished)
    {
        if (global.lapcount == 1)
            global.savedfill = global.fill;
        else if (global.lapcount > 1)
            global.fill = global.savedfill - ((global.lapcount - 1) * 100);
        
        instance_create(0, 0, obj_lap2visual);
        cutscene_event_end();
    }
}
