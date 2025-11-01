var _swap = swaps[swap_ind];

for (var i = 0; i < 3; i++)
{
    with (obj_micro_cratememory_crate)
    {
        if (ID != other.ID)
            continue;
        
        if (ind == _swap[0])
        {
            xto = other.swap_objs[_swap[1]].x;
            percent = 0;
            x_start = x;
        }
        else if (ind == _swap[1])
        {
            xto = other.swap_objs[_swap[0]].x;
            percent = 0;
            x_start = x;
        }
    }
}

swap_ind++;

if (swap_ind == array_length(swaps))
    timer[2] = 30;
else
    timer[2] = 50;
