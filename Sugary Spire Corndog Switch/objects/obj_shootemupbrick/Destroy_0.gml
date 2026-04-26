if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    event_play_multiple("event:/SFX/general/breakblock", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2));
    ds_list_add(global.SaveRoom, id);
}
