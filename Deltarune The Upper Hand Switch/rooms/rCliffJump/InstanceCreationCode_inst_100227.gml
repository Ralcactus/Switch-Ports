wall = false;

draw = function()
{
};

step = function()
{
    if (place_meeting(x, y, oPlayer) && oCC.i1 != 1)
    {
        oCC.i1 = 1;
        op.ty = 39;
    }
};
