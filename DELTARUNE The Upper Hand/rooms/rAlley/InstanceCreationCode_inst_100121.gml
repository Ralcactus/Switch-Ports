func = function()
{
    do_text(undefined, undefined, ["AND DON'T BRING IT BACK!"], ["ow", "la_-1"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 4, x + 40, y + ey, 2, 2);
};
