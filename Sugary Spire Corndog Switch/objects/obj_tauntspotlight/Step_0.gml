if (!markfordestroy)
{
    var _pl = instance_place(x, y, obj_parent_player);
    
    if (_pl != -4 && _pl.state == UnknownEnum.Value_42)
    {
        var val = points;
        event_play_multiple("event:/SFX/general/collect", x, y);
        create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), string(val));
        global.Collect += val;
        global.ComboTime += 10;
        create_collect_effect(x, y, undefined, val);
        markfordestroy = true;
        alpha = 1;
        ds_list_add(global.SaveRoom, id);
    }
}
else
{
    alpha -= 0.05;
    
    if (alpha <= 0)
        instance_destroy();
}
