if (obj_parent_player.state == UnknownEnum.Value_90)
{
    obj_parent_player.state = UnknownEnum.Value_1;
    obj_tv.staticdraw = true;
    obj_tv.statictimer = 20;
    
    if (!instance_exists(obj_tasershockwave))
        instance_create(x, y, obj_tasershockwave);
}

if (obj_parent_player.state == UnknownEnum.Value_91)
{
    obj_parent_player.state = UnknownEnum.Value_1;
    obj_tv.staticdraw = true;
    obj_tv.statictimer = 20;
}
