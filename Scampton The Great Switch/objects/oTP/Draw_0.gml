if (false && TP < 100)
    TP = 100;

if (TP > 100)
    TP = 100;

image_alpha = 1;

if (oMakeUI.Spare >= 100 || oMakeUI.SpamtonHP <= 0)
    ExtraX = -100;

x += (((38 + ExtraX) - x) / 5);
Tyme += 1;
draw_sprite_ext(sTP_Frame, 1, x - 30, y + 37, 2, 2, 0, c_white, 1);

with (oTextEngine)
{
    if (Spez == "TPa")
        instance_destroy();
}

if (round(other.TPNumb) == 100)
{
    draw_sprite_ext(sFont_Det, 13, x - 28, y + 78, 2, 2, 0, make_color_rgb(255, 242, 0), 1);
    draw_sprite_ext(sFont_Det, 1, (x - 28) + 4, y + 78 + 20, 2, 2, 0, make_color_rgb(255, 242, 0), 1);
    draw_sprite_ext(sFont_Det, 24, (x - 28) + 8, y + 78 + 40, 2, 2, 0, make_color_rgb(255, 242, 0), 1);
}
else
{
    draw_sprite_ext(sFont_Det, 75, x - 24, y + 102, 2, 2, 0, c_white, 1);
    
    with (instance_create_depth(x - 30, y + 78, -9999, oTextEngine))
    {
        Spez = "TPa";
        Text[0] = string(round(other.TPNumb));
        StringAT = 5;
        BC = false;
        Mono = true;
    }
}

yChag = 0;
Xbeg = 0;

while (yChag != round(BrownSC))
{
    if (yChag < 18)
        Xbeg += 0.05555555555555555;
    
    if (yChag >= 162)
    {
        draw_sprite_ext(sTP_Col, 0, x + 3, y + 10 + yChag, -Xbeg, 1, 0, c_white, 1);
        Xbeg -= 0.05555555555555555;
    }
    else
    {
        draw_sprite_ext(sTP_Col, 0, x + 21, y + 10 + yChag, Xbeg, 1, 0, c_white, 1);
    }
    
    yChag += 1;
}

yChag = 0;
Xbeg = 0;

while (yChag != round(OrangeSC))
{
    if (yChag < 18)
        Xbeg += 0.05555555555555555;
    
    image_index = 2;
    
    if (round(other.TPNumb) == 100)
        image_index = 4;
    
    image_alpha = 1;
    
    if (((yChag / 180) * 100) >= (TP - oMakeUI.DelTP) && oMakeUI.DelTP > 0)
        image_alpha = 0.25 + abs(sin(oAlways.Tyme * 0.05) * 0.5);
    
    if (yChag >= 162)
    {
        draw_sprite_ext(sTP_Col, image_index, x + 21, (y + 10 + 180) - yChag, Xbeg, 1, 0, c_white, image_alpha);
        Xbeg -= 0.05555555555555555;
    }
    else
    {
        draw_sprite_ext(sTP_Col, image_index, x + 3, (y + 10 + 180) - yChag, -Xbeg, 1, 0, c_white, image_alpha);
    }
    
    yChag += 1;
}

yChag = 0;
Xbeg = 0;
XMov = 0;

if (RedSC > 1)
{
    while (yChag != 180)
    {
        if (yChag < 18)
            Xbeg -= 0.05555555555555555;
        
        if (yChag >= 162)
        {
            Xbeg += 0.05555555555555555;
            XMov += 1;
        }
        
        if (yChag >= round(OrangeSC) && yChag < (round(OrangeSC) + RedSC))
            draw_sprite_ext(sTP_Col, 3, x + 2 + XMov, (y + 10 + 180) - yChag, Xbeg - 0.1, 1, 0, c_white, 1);
        
        yChag += 1;
    }
}

yChag = 0;
Xbeg = 0;
XMov = 0;

while (yChag != 180)
{
    if ((180 - yChag) <= round(OrangeSC) && (180 - yChag) > (round(OrangeSC) - WhiteSC))
        draw_sprite_ext(sTP_Col, 1, x + 21 + XMov, y + 10 + yChag, Xbeg + 0.1, 1, 0, c_white, 1);
    
    if (yChag < 18)
        Xbeg += 0.05555555555555555;
    
    if (yChag >= 162)
    {
        Xbeg -= 0.05555555555555555;
        XMov -= 1;
    }
    
    yChag += 1;
}

image_alpha = 1;
image_index = 0;
draw_self();
WhiteSC *= 0.9;

if (TP == 100)
{
    if (WhiteSC < 1)
        WhiteSC = -1;
}
else if (WhiteSC < 2)
{
    WhiteSC = 2;
}

WhiteSC += ((((180 * TP) / 100) - OrangeSC) / 10);
RedSC *= 0.9;
RedSC += ((180 - ((180 * TP) / 100) - BrownSC) / 10);
BrownSC += ((180 - ((180 * TP) / 100) - BrownSC) / 10);
OrangeSC += ((((180 * TP) / 100) - OrangeSC) / 10);
TPNumb += ((TP - TPNumb) / 3);
