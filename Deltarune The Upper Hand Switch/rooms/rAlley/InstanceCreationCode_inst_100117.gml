func = function()
{
    do_text(undefined, undefined, g_t("sign_1"), ["ow"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 1, x + 40, y + ey, 2, 2);
};
