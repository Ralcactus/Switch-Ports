if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    var rep = 6 + (sprite_width / 32);
    
    repeat (rep)
    {
        with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_debris))
            sprite_index = spr_bigdebris;
    }
    
    event_play_multiple("event:/SFX/general/breakblock", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2));
    ds_list_add(global.SaveRoom, id);
    instance_create(x - 50, y - 60, obj_beeswarm);
    instance_create(x - 75, y + 80, obj_beeswarm);
    instance_create(x - 100, y - 50, obj_beeswarm);
}

for (var i = 0; i < array_length(tiles); i++)
    scr_destroy_tile(tiles[i]);

scr_destroy_nearby_tiles();
