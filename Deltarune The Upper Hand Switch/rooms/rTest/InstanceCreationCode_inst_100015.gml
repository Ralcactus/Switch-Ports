text = "Shop";

func = function()
{
    oPlayer.x = 320;
    oPlayer.y = 440;
    room_goto(rSockShop);
};

ey = 40;

draw = function()
{
    ext(sProps, 1, x + 20, y + ey);
    ext(sProps, 0, x + 20, y + ey);
};
