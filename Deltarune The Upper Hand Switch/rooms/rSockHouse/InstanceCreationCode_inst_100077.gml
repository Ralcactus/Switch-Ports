_id = "sock";

func = function()
{
    if (oPlayer.y <= y)
    {
        do_text(undefined, undefined, g_t("5_9"), ["ow"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [14], undefined, function()
        {
            oPlayer.move = true;
        });
    }
    else
    {
        do_text(undefined, undefined, g_t("5_10"), ["ow", "forceDown"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [13], undefined, function()
        {
            with (instance_create_depth(oPlayer.x - 10, oPlayer.y - 10, 0, oDoor))
            {
                image_alpha = 0;
                _room = rSockShop;
                _x = 320;
                _y = 280;
            }
        });
    }
};

ey = 32;

draw = function()
{
    if (!array_contains(op.progress, "puppet1done"))
        ext(sProps, 1 + (op.talkN * picked), x + 40, y + ey);
    
    ext(sProps, 0, x + 40, y + ey, undefined, undefined, undefined, undefined, 1 - oCC.j2);
};
