if (ds_list_find_index(global.SaveRoom, id) == -1 && sprite_index == spr_playerFlower_closed)
{
    image_index = 0;
    sprite_index = spr_playerFlower_opening;
    ds_list_add(global.SaveRoom, id);
}
