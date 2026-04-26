if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    event_play_oneshot("event:/SFX/enemies/deathscream");
    camera_shake_add(20, 40);
    
    with (instance_create(x, y, obj_harrydead))
        sprite_index = spr_gummy_cardboard_death;
    
    repeat (2)
    {
        create_particle(x, y, spr_bangEffect);
        create_debris(x, y, spr_slapstar);
        create_debris(x, y, spr_baddieGibs);
    }
    
    if (obj_tv.sucroseTimer && global.fill != 0)
        global.fill += time_in_frames(3, 30);
}
