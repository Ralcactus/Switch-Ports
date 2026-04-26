if (sprite_index == spr_donutShitter && ds_list_find_index(global.SaveRoom, id) == -1)
{
    image_index = 0;
    sprite_index = spr_donutShitterEating;
    global.ComboFreeze = 30;
    global.ComboTime += 15;
    ds_list_add(global.SaveRoom, id);
    instance_destroy(other.id);
}
