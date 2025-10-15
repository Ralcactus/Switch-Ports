if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris((x + 16), y, spr_towerblockdebris)
    tile_layer_delete_at(1, x, y)
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2))
    ds_list_add(global.saveroom, id)
}
