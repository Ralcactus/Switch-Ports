if (obj_parent_player.state != UnknownEnum.Value_64 && obj_parent_player.state != UnknownEnum.Value_65 && obj_parent_player.state != UnknownEnum.Value_100)
{
    instance_destroy();
    
    if (instance_exists(obj_watertop))
        obj_watertop.created = 0;
    
    if (instance_exists(obj_minecartRail))
        obj_minecartRail.created = 0;
}
