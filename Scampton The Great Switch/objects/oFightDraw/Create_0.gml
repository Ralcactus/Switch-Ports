Wh = 1;
alph = 1;
Tyme = 0;
KeyZ = false;
Ztyme = 2;
Add = false;
StickExist = 50;
TheRow[0] = 0;
TheRow[1] = 0;
TheRow[2] = 0;
jRow = 0;

while (TheRow[0] == TheRow[1] && TheRow[0] == TheRow[2])
{
    TheRow[0] = irandom_range(0, 2);
    TheRow[1] = irandom_range(0, 2);
    TheRow[2] = irandom_range(0, 2);
}

while (TheRow[0] > 1 && TheRow[1] > 1 && TheRow[2] > 1)
{
    TheRow[0] -= 1;
    TheRow[1] -= 1;
    TheRow[2] -= 1;
}

if (oP.setG)
{
    TheRow[0] = 0;
    TheRow[1] = 0;
    TheRow[2] = 0;
    jRow = 0;
}

if (oMakeUI.Actions[0] == "1_1_NAME")
{
    with (instance_create_depth(311 + (72 * TheRow[0]), 365, -20000, oFightStick))
    {
        Row = other.TheRow[0];
        Pep = 0;
    }
}
else
{
    TheRow[0] = 2;
}

if (oMakeUI.Actions[1] == "2_1_NAME")
{
    with (instance_create_depth(311 + (72 * TheRow[1]), 403, -20000, oFightStick))
    {
        Row = other.TheRow[1];
        Pep = 1;
    }
}
else
{
    TheRow[1] = 2;
}

if (oMakeUI.Actions[2] == "3_1_NAME")
{
    with (instance_create_depth(311 + (72 * TheRow[2]), 441, -20000, oFightStick))
    {
        Row = other.TheRow[2];
        Pep = 2;
    }
}
else
{
    TheRow[2] = 2;
}
