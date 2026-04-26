if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    repeat (12)
    {
        with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_baddieDead))
            sprite_index = spr_deadbee;
    }
    
    global.ComboTime = 60;
    global.Combo += 3;
    ds_list_add(global.SaveRoom, id);
}
