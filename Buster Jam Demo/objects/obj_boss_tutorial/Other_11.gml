if (frenzy_started)
    exit;

var _start;

if (win)
{
    _start = 3;
    
    if (state == 2)
        _start = 5;
    else if (state == 3)
        _start = 7;
}
else if (losses == 1)
{
    _start = choose(20, 27);
}
else if (losses == 2)
{
    _start = 21;
}
else if (losses == 3)
{
    _start = 22;
}
else if (losses == 4)
{
    _start = 23;
}
else if (losses == 5)
{
    _start = 24;
}
else if (losses == 6)
{
    _start = 25;
}
else if (losses >= 7 && losses <= 9)
{
    _start = irandom_range(23, 25);
}
else if (losses == 10)
{
    _start = 29;
}
else
{
    _start = 31;
}

scene_create("Dialogue/tutorial/tutorial.json", _start);
