image_speed = 0.35;
image_xscale = playerID.xscale;
x = playerID.x;
y = playerID.y;

if (playerID.angry == false || playerID.state != UnknownEnum.Value_1)
    instance_destroy();
