text = "Mini Faces Test";

func = function()
{
    do_text(undefined, undefined, ["* TEST"], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, [function()
    {
        miniFace(50, 50, 30, 1, ["Susie1", "Susie2", "Susie3"]);
        miniFace(250, 0, 30, 15, ["Ralsei1"]);
        miniFace(350, 75, 0, 13, ["SOCKSWALD"], sFontSock);
    }], function()
    {
        oPlayer.move = true;
    });
};
