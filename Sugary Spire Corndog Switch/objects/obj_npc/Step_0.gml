speaking = place_meeting(x, y, obj_parent_player);
sprite_index = speaking ? speak : idle;
mytex_x -= 0.5;
mytex_x %= sprite_get_width(mytex);
mytex_y = wave(-5, 5, 5, 20);
propdex += 0.35;
propdex %= 3;

if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    if (place_meeting(x, y, obj_parent_player) && (obj_parent_player.state == UnknownEnum.Value_87 || obj_parent_player.state == UnknownEnum.Value_96))
    {
        for (var i = 0; i < 500; i += 25)
            create_collect_effect(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), undefined, 25);
        
        ds_list_add(global.SaveRoom, id);
        obj_parent_player.state = UnknownEnum.Value_1;
        instance_create(x, y, obj_poofeffect);
        global.Collect += 500;
        global.ComboTime = 60;
        other.canCollect = false;
    }
}
