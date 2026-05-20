text = "Automatic line separator test";

func = function()
{
    do_text(undefined, undefined, ["* 1 22 333 4444 55555 666666 7777777 88888888 999999999 11 1 1 1 1 1 11111111111 121212121212 1313131313131 14141414141414", "* 2nd", "* 3rd"], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};
