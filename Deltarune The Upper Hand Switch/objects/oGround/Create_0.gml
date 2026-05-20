sprite_index = sG1;
image_alpha = 1;
image_xscale = 2;
image_yscale = 2;
depth = -y;
_id = irandom_range(0, 999999999999);
wobtime = 0;

if (room != rSoulTutorial)
{
    if (oBUI.patternTime < 13)
        _y = 480;
    else
        _y = 0;
    
    if (oBUI.attack == "final")
    {
        image_alpha = 0;
        image_xscale = 0;
        soulRoof = -99999;
        wobtime = irandom_range(1, 360);
    }
}
else
{
    _y = 480;
}

_yt = 20;
move = [0, 0];
ty = 0;
over = false;
shake = 0;
off = 0;
startX = x;
startY = y;
soulY = 0;
soulGrav = 0;
soulRoof = 10;
