ty++;
x += moveX;
y += moveY;

if (place_meeting(x, y, oSoul))
{
    if (oSoul.iframes == 0)
        oSoul.wow = true;
    
    des();
}

if (ty > 200)
{
    if (x < -200)
        des(0);
    
    if (x > 840)
        des(0);
    
    if (y < -200)
        des(0);
    
    if (y > 680)
        des(0);
}
