text = "Start Battle";

func = function()
{
    room_goto(rBattle);
};

ey = 40;

draw = function()
{
    ext(sKrisA_Idle, op.ty / 10, x + 20, y + ey);
};
