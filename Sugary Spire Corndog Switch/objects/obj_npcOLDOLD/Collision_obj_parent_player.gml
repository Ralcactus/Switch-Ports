if (obj_parent_player.state != UnknownEnum.Value_93 && !instance_exists(obj_uparrow))
    instance_create(x, y - 32, obj_uparrow);

if (obj_parent_player.key_up2)
{
    obj_parent_player.state = UnknownEnum.Value_93;
    drawing = 1;
    obj_parent_player.x = x + (64 * image_xscale);
    
    if (image_xscale == 1)
        obj_parent_player.xscale = -1;
    else if (image_xscale == -1)
        obj_parent_player.xscale = 1;
}
