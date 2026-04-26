if (picy == 640)
{
    if (kungAirTime == 0 && global.kungAirTime == 1)
    {
        up = 1;
        sprite = spr_bombblock;
        kungAirTime = 1;
        alarm[0] = 250;
    }
}

if (picy == 300)
    up = 0;

if (up == 1)
    picy -= 10;
