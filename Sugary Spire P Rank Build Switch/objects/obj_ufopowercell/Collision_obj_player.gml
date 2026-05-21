if (canbecollected == true)
{
    if (obj_player.state == states.smirk)
    {
        obj_player.ufotimer += 4;
        obj_player.ufomaxspeed += 1;
        canbecollected = false;
        image_alpha = 0.5;
    }
}
