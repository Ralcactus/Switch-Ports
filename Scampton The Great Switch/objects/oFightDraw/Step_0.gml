Tyme += 1;
KeyZ = keyboard_check(ord("Z"));

if (keyboard_check(vk_enter))
    KeyZ = true;

if (KeyZ)
    Ztyme += 1;
else
    Ztyme = 0;

if (KeyZ && Ztyme == 1)
{
    Wh = 1;
    Ztyme = 2;
    
    with (oFightStick)
    {
        if (x <= 190 && oFightDraw.jRow == Row && State == 0)
        {
            State = 1;
            oFightDraw.Add = true;
        }
    }
}

with (oFightStick)
{
    if (x < 63 && State == 0)
    {
        State = 2;
        oFightDraw.Add = true;
    }
}

if (TheRow[0] != jRow && TheRow[1] != jRow && TheRow[2] != jRow)
    jRow += 1;
