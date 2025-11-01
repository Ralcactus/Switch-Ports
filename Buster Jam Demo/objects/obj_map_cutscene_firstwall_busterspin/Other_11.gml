if (hspd < 0)
{
    hspd = approach(hspd, 0, 0.25);
    
    if (hspd == 0)
    {
        if (last_hit && timer[1] == -1)
            timer[1] = 25;
        else
            timer_func[0]();
    }
}
else if (!last_hit)
{
    hspd += 0.2;
}
