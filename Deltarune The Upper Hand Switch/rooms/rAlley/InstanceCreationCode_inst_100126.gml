func = function()
{
    do_text(undefined, undefined, g_t("sign_6"), ["ow"], [sFontSans], undefined, [snd_txtSans], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 7, x + 20, y + ey, 2, 2);
};
