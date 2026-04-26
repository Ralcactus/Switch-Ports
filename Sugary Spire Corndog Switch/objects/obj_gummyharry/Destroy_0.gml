if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    repeat (2)
    {
        create_particle(x, y, spr_bangEffect);
        create_debris(x, y, spr_slapstar);
        create_debris(x, y, spr_baddieGibs);
    }
    
    with (instance_create(x, y, obj_harrydead))
        paletteSelect = other.paletteSelect;
    
    instance_create(0, 0, obj_sugarrush);
    global.panic = true;
    var time_array = scr_escapetimes();
    global.fill = time_in_frames(time_array[0], time_array[1]);
    obj_tv.target_fill = global.fill;
    global.wave = 0;
    global.maxwave = global.fill;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
    
    event_play_oneshot("event:/SFX/general/escaperumble");
    event_play_oneshot("event:/SFX/enemies/kill");
    global.ComboFreeze = 30;
    global.ComboTime = 60;
    ds_list_add(global.SaveRoom, id);
}
