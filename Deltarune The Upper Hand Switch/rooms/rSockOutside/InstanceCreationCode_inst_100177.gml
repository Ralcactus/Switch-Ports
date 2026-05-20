res_i();

draw = function()
{
};

func = function()
{
    if (array_contains(op.progress, "sockIntro"))
        pcikSound = snd_txtSock;
    else
        pcikSound = snd_nosound;
    
    do_text(undefined, undefined, g_t("3_5"), ["ow"], [sFontSock], undefined, [pcikSound], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};
