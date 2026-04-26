if (state == UnknownEnum.Value_37)
{
    grounded = 0;
    x = playerID.x;
    y = approach(y, playerID.y - 40, 10);
    image_xscale = playerID.xscale;
}

image_speed = 1 - (countdown / 240);
