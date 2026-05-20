func = function()
{
    do_text(undefined, undefined, g_t("5_7"), ["ow", "forceDown"], [sFont1, sFontSock], undefined, [snd_txtMonster, snd_txtSock, snd_txtSock], undefined, undefined, [-1, 26, 13], [-1, function()
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

ey = 50;

draw = function()
{
    if (array_contains(op.progress, "puppet1done"))
    {
        step = function()
        {
        };
        
        changeDepth = 50;
    }
    
    ext(sProps, 14, x + 48, y + ey);
    ext(sProps, 14, x + 48, y + ey, undefined, undefined, undefined, 0, oCC.j2);
};
