func = function()
{
    do_text(undefined, undefined, ["IT'S STILL HERE!"], ["ow"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 5, x + 20, y + ey, 2, 2);
};
