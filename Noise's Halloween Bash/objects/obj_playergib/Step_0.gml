if (game_paused())
    exit;

vsp += grav;

if (scr_solid(x, y + 1, collideables))
    hsp = approach(hsp, 0, 0.1);

if (scr_solid(x + hsp, y, collideables))
{
    while (!scr_solid(x + sign(hsp), y, collideables))
        x += sign(hsp);
    
    if (abs(hsp) > 2)
    {
        hsp = round(-hsp / 2);
        scr_fmod_soundeffectONESHOT("event:/sfx/player/gibland", x, y);
    }
    else
    {
        hsp = 0;
    }
}

x += hsp;
angle -= hsp;

if (scr_solid(x, y + vsp, collideables))
{
    while (!scr_solid(x, y + sign(vsp), collideables))
        y += sign(vsp);
    
    if (abs(vsp) > 2)
    {
        vsp = round(-(vsp / 2));
        scr_fmod_soundeffectONESHOT("event:/sfx/player/gibland", x, y);
    }
    else
    {
        vsp = 0;
    }
}

y += vsp;
