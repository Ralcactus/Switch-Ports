image_xscale = obj_parent_player.xscale;
x = obj_parent_player.x;
y = obj_parent_player.y;

if (!global.freezeframe && obj_parent_player.state != UnknownEnum.Value_18 && obj_parent_player.state != UnknownEnum.Value_0 && obj_parent_player.state != UnknownEnum.Value_86)
    instance_destroy();
