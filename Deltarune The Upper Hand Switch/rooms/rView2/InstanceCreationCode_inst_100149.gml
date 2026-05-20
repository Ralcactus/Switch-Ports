if (op.eggCounter >= 10)
{
    _room = rEgg;
    _x = 320;
    _y = 940;
}
else
{
    _room = rView;
    _x = 60;
    _y = 360;
}

op.eggCounter = 0;
