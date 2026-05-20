function RotSka(arg0, arg1, arg2)
{
    x += (sin(arg0 * 0.017453292519943295) * arg1);
    y += (cos(arg0 * 0.017453292519943295) * arg2);
}

function RotMx(arg0, arg1)
{
    return sin(arg0 * 0.017453292519943295) * arg1;
}

function RotMy(arg0, arg1)
{
    return cos(arg0 * 0.017453292519943295) * arg1;
}
