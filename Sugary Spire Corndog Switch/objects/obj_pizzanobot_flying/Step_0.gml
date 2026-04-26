event_inherited();

if (state != UnknownEnum.Value_1)
{
    grav = 0.5;
}
else
{
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    if (y > ystart)
        y = approach(y, ystart, 1);
}
