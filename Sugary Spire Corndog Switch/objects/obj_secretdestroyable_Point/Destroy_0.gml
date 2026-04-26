if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    var rep = 3 + (sprite_width / 32);
    
    repeat (rep)
        create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_blockdebris);
    
    event_play_multiple("event:/SFX/general/collect", x, y);
    event_play_multiple("event:/SFX/general/breakblock", x, y);
    ds_list_add(global.SaveRoom, id);
    create_collect_effect(x, y, undefined, 10);
    create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), "10");
    global.Collect += 10;
    global.PizzaMeter += 1;
    global.ComboFreeze = clamp(global.ComboFreeze + 5, 0, 30);
    global.ComboTime += 15;
}

for (var i = 0; i < array_length(tiles); i++)
    scr_destroy_tile(tiles[i]);

scr_destroy_nearby_tiles();
