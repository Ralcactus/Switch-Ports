use_keys();

if (cur == -1)
{
    if (TapLEFT)
    {
        TapLEFT = false;
        cur = 0;
    }
    
    if (TapRIGHT)
    {
        TapRIGHT = false;
        cur = 1;
    }
}
else if (TapZ)
{
    functions[cur]();
    des();
}

if (cur == 0)
{
    if (TapRIGHT)
    {
        TapRIGHT = false;
        cur = 1;
    }
}

if (cur == 1)
{
    if (TapLEFT)
    {
        TapLEFT = false;
        cur = 0;
    }
}
