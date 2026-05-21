oldx = x;
oldy = y;

if (falling == false)
{
    if (place_meeting(x, y - 31, obj_player))
    {
        with (obj_player)
        {
            if (place_meeting(x, y + 31, other.id) && y <= other.y && grounded && vsp >= 0)
                other.falling = true;
        }
    }
}

if (falling == true)
{
    if (--fallbuffer <= 0)
    {
        fallbuffer = 0;
        
        if (vsp < 10)
            vsp += grav;
        
        TrueY += vsp;
        y = round(TrueY);
        
        if (y > (room_height + 100))
            event_user(0);
    }
}
