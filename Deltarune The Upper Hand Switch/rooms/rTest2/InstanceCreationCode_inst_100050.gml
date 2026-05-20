text = "Cutscene move test (LEFT)";
drawSelf = true;
res_i();

func = function()
{
    i = 1;
    move_player(30, 320, 340, -1, 4, function()
    {
        oPlayer.move = true;
        oPlayer.freeMove = false;
    });
    move_follow(1, 30, 260, 320, -1, 4);
    move_follow(2, 30, 380, 320, -1, 4);
};
