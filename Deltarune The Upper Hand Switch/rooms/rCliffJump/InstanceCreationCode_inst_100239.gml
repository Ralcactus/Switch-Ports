wall = false;

draw = function()
{
};

step = function()
{
    if (place_meeting(x, y, oPlayer) && oCC.i1 != 2)
        oCC.i1 = 2;
};
