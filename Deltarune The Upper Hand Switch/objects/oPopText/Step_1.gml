ty++;

if (tap < 2)
{
    y += grav;
    grav++;
    
    if (y > startY)
    {
        y = startY;
        grav = -3;
        tap++;
    }
}

if (ySc != 1 && tap != 3)
    ySc += 0.2;

x += right;

if (right != 0)
    right--;

if (ty == 50)
    tap = 3;

if (tap == 3)
{
    ySc += 0.2;
    alpha -= 0.1;
    y--;
}

if (alpha <= 0)
    des(0);
