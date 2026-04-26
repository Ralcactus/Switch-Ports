if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    camera_shake_add(20, 40);
    event_play_oneshot("event:/SFX/player/groundpound", x, y);
    ds_list_add(global.SaveRoom, id);
}
