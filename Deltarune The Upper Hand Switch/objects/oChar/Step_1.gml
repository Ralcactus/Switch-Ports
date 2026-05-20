ty++;

if (moveTime[0] > 0)
{
    if (moveTime[0] == moveTime[1])
    {
        sprite_index = moveTime[6];
        image_speed = moveTime[7];
    }
    
    moveTime[0]--;
    x += ((moveTime[2] - moveTime[4]) / moveTime[1]);
    y += ((moveTime[3] - moveTime[5]) / moveTime[1]);
    
    if (array_contains(seed, "arc1"))
        ey = -dsin((180 / moveTime[1]) * moveTime[0]) * 50;
    
    if (array_contains(seed, "arc2"))
        ey = -dsin((180 / moveTime[1]) * moveTime[0]) * 100;
    
    if (array_contains(seed, "arc3"))
        ey = -dsin((180 / moveTime[1]) * moveTime[0]) * 26;
    
    if (array_contains(seed, "arc4"))
        ey = -dsin((180 / moveTime[1]) * moveTime[0]) * 200;
    
    if (array_contains(seed, "shrink"))
    {
        image_xscale -= (2 / moveTime[1]);
        image_yscale -= (2 / moveTime[1]);
        image_alpha -= (1.25 / moveTime[1]);
    }
    
    if (moveTime[0] == 0 && moveTime[8] != -1)
    {
        moveTime[8]();
        ey = 0;
    }
}

if (func != -1)
    func();

depth = -y;

if (forceFont)
    depth = -9999;
