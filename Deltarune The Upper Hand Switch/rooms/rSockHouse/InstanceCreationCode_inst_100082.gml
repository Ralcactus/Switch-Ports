func = function()
{
    do_text(undefined, undefined, g_t("5_1"), ["ow"], [sFont1, sFontSock], undefined, [snd_txtMonster, snd_txtSock], undefined, undefined, [-1, 8], [-1, function()
    {
        with (oInteract)
        {
            if (_id == "sock")
                picked = 1;
        }
    }], function()
    {
        oPlayer.move = true;
    });
};

ey = 30;

draw = function()
{
    ext(sProps, 13, x + 30, y + ey);
    ext(sProps, 13, x + 30, y + ey, undefined, undefined, undefined, 0, oCC.j2);
};
