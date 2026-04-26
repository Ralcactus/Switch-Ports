function state_player_gumballoon()
{
    move = key_left + key_right;
    
    if (move != 0 || key_up)
    {
        dir = move;
        dir2 = key_up;
    }
    
    hsp = approach(hsp, dir * 6, 1.3);
    verticalMovespeed = approach(verticalMovespeed, dir2 * -6, 1.3);
    vsp = verticalMovespeed;
    
    if (sign(hsp) != 0)
        xscale = sign(hsp);
}
