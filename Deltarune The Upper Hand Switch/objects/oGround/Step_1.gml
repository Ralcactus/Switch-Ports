ty++;

if (array_contains(seed, "spin"))
{
    if (array_contains(seed, "1"))
        off = 0;
    
    if (array_contains(seed, "2"))
        off = 90;
    
    if (array_contains(seed, "3"))
        off = 180;
    
    if (array_contains(seed, "4"))
        off = 270;
    
    move[0] = dcos(off + (ty * 2)) * 4;
    move[1] = dsin(off + (ty * 2)) * 4;
}

if (op.challengeMode)
{
    if (array_contains(seed, "cmMOVE"))
    {
        off = 90;
        move[0] = dcos(off + (ty * 3)) * 2.5;
    }
}

if (room != rSoulTutorial)
{
    if (oBUI.attack == "final" && !array_contains(seed, "instaVis"))
    {
        wobtime++;
        
        if (op.st_speedrunTimer == -1)
            move[1] = dsin(wobtime * 5) * 0.25;
    }
}

x += move[0];
y += move[1];

if (shake > 0)
    shake--;

with (oSoul)
{
    other.soulY = y;
    other.soulGrav = grav;
}

if (move[1] < 0 && soulY > soulRoof && soulGrav > -1)
{
    while (place_meeting(x, y, oSoul) || place_meeting(x, y + 2, oSoul))
    {
        oSoul.y--;
        oSoul.smash = false;
        oSoul.grav = 0;
    }
}

depth = -y;

if (room != rSoulTutorial)
{
    if ((ty > 20 && oBUI.attack != "final") && (x < -1000 || x > 1640 || y < -500 || y > 1480))
        des();
    
    if (oBUI.attack == "final")
    {
        depth = 0;
        
        if (ty == 1)
        {
            image_alpha = 0;
            starY = 9999;
        }
        
        with (oAttack)
        {
            if (as("star2"))
                other.starY = y;
        }
        
        if ((y > starY && ty > 20) || array_contains(seed, "instaVis"))
        {
            image_xscale = 2;
            
            if (image_alpha < 1)
                image_alpha += 0.2;
        }
    }
}
