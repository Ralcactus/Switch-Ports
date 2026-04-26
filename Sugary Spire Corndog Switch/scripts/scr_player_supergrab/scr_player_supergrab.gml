function state_player_supergrab()
{
    image_speed = animation_end() ? 0 : 0.35;
    hsp = movespeed;
    scr_conveyorBeltKinematics();
    
    if (grounded && vsp > 0)
    {
        movespeed = approach(movespeed, 0, 0.2);
        
        if (movespeed == 0)
        {
            state = UnknownEnum.Value_1;
            landAnim = false;
        }
    }
}
