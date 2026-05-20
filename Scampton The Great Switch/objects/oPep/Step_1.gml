x = StartX;
y = StartY + oMakeUI.HUDy;

if (HurtTime != 0)
    HurtTime--;

Tyme++;

if (Tyme == 1)
{
    sprite_index = ans[0];
    image_index = 0;
}

if (oMakeUI.HP[Pep - 1] > 0 && sprite_index == ans[8])
{
    sprite_index = ans[0];
    image_index = 0;
}

if (HurtTime == 1 && sprite_index != ans[5])
    sprite_index = ans[0];

if (sprite_index != ans[0])
{
    if (Pep == 1)
    {
        x -= round(HurtTime / 2);
        pepAN(1, 4);
        pepAN(3, 8);
        pepAN(5, 7);
        pepAN(7, 10);
    }
    
    if (Pep == 2)
    {
        y += round(HurtTime / 4);
        pepAN(1, 5);
        pepAN(3, 8);
        pepAN(5, 5);
    }
    
    if (Pep == 3)
    {
        x += round(HurtTime / 2);
        pepAN(1, 4);
        pepAN(3, 10);
        pepAN(5, 5);
        pepAN(8, 7);
    }
}
else
{
    image_speed = 1;
}
