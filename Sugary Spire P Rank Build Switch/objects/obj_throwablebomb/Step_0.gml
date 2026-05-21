switch (state)
{
    case states.normal:
        scr_collide();
        break;
    
    case states.grab:
        grounded = 0;
        x = playerID.x;
        y = approach(y, playerID.y - 40, 10);
        image_xscale = playerID.xscale;
        break;
    
    case states.finishingblow:
        break;
}

image_speed = 1 - (countdown / 240);
