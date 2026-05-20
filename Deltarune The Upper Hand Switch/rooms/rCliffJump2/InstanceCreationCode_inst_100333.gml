wall = false;

step = function()
{
    if (place_meeting(x, y, oPlayer) && oPlayer.move)
    {
        do_text(undefined, undefined, g_t("13_1"), ["ow", "forceDown"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [10, 8], undefined, function()
        {
            oPlayer.move = true;
        });
        des();
    }
};
