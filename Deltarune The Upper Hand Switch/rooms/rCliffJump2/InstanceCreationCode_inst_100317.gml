wall = false;
res_i();

draw = function()
{
};

step = function()
{
    if (place_meeting(x, y, oPlayer) && i1 == 0)
        i1 = 1;
    
    if (i1 == 1)
        i++;
    
    if (i == 20)
    {
    }
};
