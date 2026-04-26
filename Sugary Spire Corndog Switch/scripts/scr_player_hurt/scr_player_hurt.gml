function state_player_hurt()
{
    if (place_meeting_solid(x + hsp, y))
        movespeed = 0;
    
    hsp = xscale * -movespeed;
    combo = 0;
    machTwo = 0;
    jumpAnim = true;
    landAnim = !grounded;
    jumpStop = false;
    crouchAnim = false;
    hurted = true;
    turning = 0;
    alarm[5] = 2;
    alarm[7] = 60;
    
    if (grounded && vsp > 0)
    {
        if (state == UnknownEnum.Value_68)
        {
            state = UnknownEnum.Value_1;
            movespeed = 0;
        }
    }
    
    image_speed = 0.35;
}
