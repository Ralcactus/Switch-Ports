func = function()
{
    do_text(undefined, undefined, g_t("5_4"), ["ow"], [sFont1, sFont1, sFontSock, sFontSock, sFont1], undefined, [snd_txtMonster, snd_txtral, snd_txtSock, snd_txtSock, snd_txtSus], undefined, undefined, [-1, 7, 13, 10, 2], [-1, -1, function()
    {
        with (oInteract)
        {
            if (_id == "sock")
                picked = 1;
        }
    }, -1, function()
    {
        with (oInteract)
        {
            if (_id == "sock")
                picked = 0;
        }
    }], function()
    {
        oPlayer.move = true;
    });
};

ey = 40;

draw = function()
{
    ext(sProps, 3, x + 20, y + ey);
    ext(sProps, 3, x + 20, y + ey, undefined, undefined, undefined, 0, oCC.j2);
};
