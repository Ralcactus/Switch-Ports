if (game_paused())
    exit;

alpha = approach(alpha, !roomchanged, 0.1);

if (alpha >= 1 && !roomchanged)
{
    updatecam = true;
    
    with (obj_player)
    {
        room_goto(targetroom);
        targetdoor = -1;
        
        with (ondeathplatform)
        {
            currpath = pathB;
            x = path_get_x(currpath, 0);
            y = path_get_y(currpath, 0);
            other.x = x;
            other.y = y - 45.65;
        }
    }
    
    roomchanged = true;
}

if (alpha <= 0 && roomchanged)
    instance_destroy();
