hsp = movespeed;

if (grounded)
{
    if (vsp > 1)
        vsp *= -0.5;
    
    movespeed = approach(movespeed, 0, 0.2);
}
