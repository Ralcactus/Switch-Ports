if (game_paused())
    exit;

if (updatecam)
{
    updatecam = false;
    
    with (obj_player)
    {
        with (ondeathplatform)
        {
            with (obj_drawcontroller)
            {
                camX = path_get_x(other.currpath, 1);
                camY = path_get_y(other.currpath, 1) - 46 - 30;
                deathplat_camupdate();
            }
        }
    }
}
