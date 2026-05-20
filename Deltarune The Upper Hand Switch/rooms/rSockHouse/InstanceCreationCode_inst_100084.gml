func = function()
{
    with (oInteract)
    {
        if (_id == "sock")
            picked = 1;
    }
    
    do_text(undefined, undefined, g_t("5_5"), ["ow"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [10, 8], undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 20;

draw = function()
{
    ext(sProps, 15, x + 20, y + ey);
    ext(sProps, 15, x + 20, y + ey, undefined, undefined, undefined, 0, oCC.j2);
};
