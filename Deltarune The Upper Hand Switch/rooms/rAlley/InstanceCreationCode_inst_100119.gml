func = function()
{
    do_text(undefined, undefined, g_t("sign_2"), ["ow"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 2, x + 20, y + ey, 2, 2);
};
