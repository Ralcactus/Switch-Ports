if (game_paused())
    exit;

if (respawntimer <= 0)
{
    with (instance_create_depth(x, y, depth, obj_torchplatform))
    {
        scale = 0;
        path = other.path;
        movespeed = other.movespeed;
        dir = other.image_xscale;
        skipfirecycle = true;
        skipcycle = true;
        image_xscale = 0;
        image_yscale = 0;
    }
    
    instance_destroy();
}

respawntimer--;
