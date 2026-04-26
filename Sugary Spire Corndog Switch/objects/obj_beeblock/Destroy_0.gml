if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    with (instance_create(x, y, obj_puffEffect))
    {
        image_speed = 0.35;
        sprite_index = spr_beeblockdestroy;
    }
    
    ds_list_add(global.SaveRoom, id);
    global.Collect += 150;
    global.PizzaMeter += 5;
    global.ComboFreeze = 30;
    global.ComboTime += 45;
    create_small_number(x, y, "150");
}
