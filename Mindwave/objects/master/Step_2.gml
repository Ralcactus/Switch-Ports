if (mouselock != mouselock_before)
    mouselock_before = mouselock;

if (game_focused)
{
    if (mouselock)
    {
        var wx = window_get_x();
        var wy = window_get_y();
        var do_lock = true;
        
        switch (settings.mouselock)
        {
            case 0:
                break;
            
            case 1:
                do_lock = instance_exists(obj_minigame_controller) && (obj_minigame_controller.game_active && !obj_minigame_controller.paused);
                break;
            
            case 2:
                do_lock = false;
                break;
        }
    }
    else
    {
    }
}

