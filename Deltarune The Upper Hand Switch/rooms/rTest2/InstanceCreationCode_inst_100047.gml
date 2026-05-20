text = "Sock font dialouge and faces";

func = function()
{
    do_text(undefined, undefined, ["A B C D E F G H I J K L M N O P Q R S T U V W X Y Z", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "F FFF FF F FFFF F FF F FFF F FFFFF F FF FF F FF F F F FFFFF F F F F F "], ["ow"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [-1, -1, 0], undefined, function()
    {
        oPlayer.move = true;
    });
};
