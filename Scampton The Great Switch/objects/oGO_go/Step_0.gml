if (Stage == 0)
{
    if (oP.Deaths == 1)
        oAlways.CameraY -= 10;
    else
        oAlways.CameraY -= 20;
}
else if (oP.Deaths == 1)
{
    oAlways.CameraY += ((0 - oAlways.CameraY) / 20);
}
else
{
    oAlways.CameraY += ((0 - oAlways.CameraY) / 10);
}

if (Stage == 1)
{
    Stage = 2;
    oAlways.CameraY = 600;
    instance_destroy(oSoulShard);
    
    if (Seed == 1)
        scrSkipIntro();
}

if (Stage == 0 && oAlways.CameraY == -480)
{
    Stage = 1;
    
    if (Seed == 1)
        room_goto(rBattle_2);
    
    if (Seed == 2)
        room_goto(rMainu);
}

if (Stage == 2 && round(oAlways.CameraY) == 0)
{
    oAlways.CameraY = 0;
    instance_destroy();
}
