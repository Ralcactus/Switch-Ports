x = playerID.x;
y = playerID.y;
image_xscale = playerID.xscale;

if (!(playerID.state == UnknownEnum.Value_64 && playerID.sprite_index != playerID.spr_mach1) && playerID.state != UnknownEnum.Value_65)
    instance_destroy();
