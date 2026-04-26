if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    var rep = 3 + round(sprite_width / 16);
    
    repeat (rep)
        create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_bigdebris, 0.35);
    
    event_play_multiple("event:/SFX/general/breakblock", x, y);
    event_play_multiple("event:/SFX/general/collect", x, y);
    ds_list_add(global.SaveRoom, id);
    create_small_number(x, y, "50");
    global.ComboFreeze = 30;
    global.ComboTime += 45;
    global.Collect += 50;
    global.PizzaMeter += 5;
}

for (var i = 0; i < array_length(tiles); i++)
    scr_destroy_tile(tiles[i]);

scr_destroy_nearby_tiles();
