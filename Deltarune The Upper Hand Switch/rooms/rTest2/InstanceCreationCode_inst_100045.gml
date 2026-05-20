text = "Papyrus font dialouge";

func = function()
{
    do_text(undefined, undefined, ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", "ABC DEF GHI JKL MNO PQR STU VWX YZ"], ["ow"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};
