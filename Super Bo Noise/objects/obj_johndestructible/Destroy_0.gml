if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (7)
        create_debris((x + 32), (y + 32), spr_johndestructible_debris)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2))
    ds_list_add(global.saveroom, id)
}
