draw = function()
{
};

func = function()
{
    do_text(undefined, undefined, g_t("5_6"), ["ow"], [sFont1, sFont1, sFontSock, sFontSock, sFontSock, sFont1], undefined, [snd_txtMonster, snd_txtMonster, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtral, snd_txtSus], undefined, undefined, [-1, -1, 25, 25, 25, 21, 17], [-1, -1, function()
    {
        with (oInteract)
        {
            if (_id == "sock")
                picked = 1;
        }
    }, -1, -1, function()
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
