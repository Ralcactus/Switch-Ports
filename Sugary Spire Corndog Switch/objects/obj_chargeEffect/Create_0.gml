image_speed = 0.5;
depth = -30;

updateEffectPosition = function()
{
    x = playerID.x;
    y = playerID.y;
    image_xscale = playerID.image_xscale;
    image_yscale = 1;
    
    if (playerID.state == UnknownEnum.Value_100)
    {
        x += (32 * playerID.xscale);
    }
    else if (playerID.state == UnknownEnum.Value_28)
    {
        x += (32 * playerID.xscale);
        y += 20;
        image_yscale = 0.65;
    }
    else
    {
        x += (16 * playerID.xscale);
    }
    
    image_angle = playerID.draw_angle;
};

updateEffectPosition();
