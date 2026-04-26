if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    with (instance_create(x, y, obj_mushroomCloudEffect))
    {
        sprite_index = spr_taunteffect;
        depth = -2;
    }
    
    ds_list_add(global.KeyFollowerList, instance_create(x, y, obj_spookey));
    event_play_oneshot("event:/SFX/general/collecttoppin");
    other.keyParticles = true;
    other.alarm[7] = 30;
    global.ComboFreeze = 30;
    global.ComboTime = 60;
    ds_list_add(global.SaveRoom, id);
    instance_destroy();
    scr_queue_tvanim(spr_pizzytvkey, 150);
}
