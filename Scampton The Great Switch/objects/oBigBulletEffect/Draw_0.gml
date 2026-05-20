if (Stoped)
    Alpha -= 0.05;
else
    Alpha += 0.1;

if (Var1 == 1)
{
    image_alpha = 0;
    instance_destroy();
}
else
{
    image_alpha = Alpha;
}

if ((Var1 == 2 || Var1 == 3) && !Stoped)
    image_alpha = 0.5;

if (Stoped && image_alpha <= 0)
    instance_destroy();

Count = 0;
Ang = 0;

with (oSoul)
{
    if (Soul_ID == other.Seed)
    {
        other.x = x;
        other.y = y;
    }
}

while (Count != round(Var1))
{
    Count += 1;
    Ang += ChangeVar;
    x += (cos(Ang / 57) * Times);
    y -= (sin(Ang / 57) * Times);
}

draw_self();
Count = 0;
Ang = 0;

with (oSoul)
{
    if (Soul_ID == other.Seed)
    {
        other.x = x;
        other.y = y;
    }
}

while (Count != round(Var1))
{
    Count += 1;
    Ang += ChangeVar;
    x += (cos((90 + Ang) / 57) * Times);
    y -= (sin((90 + Ang) / 57) * Times);
}

draw_self();
Count = 0;
Ang = 0;

with (oSoul)
{
    if (Soul_ID == other.Seed)
    {
        other.x = x;
        other.y = y;
    }
}

while (Count != round(Var1))
{
    Count += 1;
    Ang += ChangeVar;
    x += (cos((180 + Ang) / 57) * Times);
    y -= (sin((180 + Ang) / 57) * Times);
}

draw_self();
Count = 0;
Ang = 0;

with (oSoul)
{
    if (Soul_ID == other.Seed)
    {
        other.x = x;
        other.y = y;
    }
}

while (Count != round(Var1))
{
    Count += 1;
    Ang += ChangeVar;
    x += (cos((270 + Ang) / 57) * Times);
    y -= (sin((270 + Ang) / 57) * Times);
}

draw_self();
Var1 -= 0.5;

if (Var1 < 1)
    Var1 = 1;

if (!Stoped && oSoul.BigTyme == 1)
    Stoped = true;
