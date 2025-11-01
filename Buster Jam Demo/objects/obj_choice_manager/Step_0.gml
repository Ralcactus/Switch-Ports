if (!ready)
    exit;

timer_logic(0);
timer_logic(1);
timer_logic(2);
var _selected = selected;

if (all_in)
    alpha_arrow = approach(alpha_arrow, 1, 0.1);

if (done || !all_in)
    yAxis = 0;
else
    yAxis = input_check_pressed("down") - input_check_pressed("up");

selected += yAxis;
selected = clamp(selected, 0, nodes - 1);

if (selected != _selected)
{
    xscale[selected] = 0.98;
    yscale[selected] = 0.85;
    
    if (selected > _selected)
        select_yoff = -22;
    else
        select_yoff = 22;
}

select_xoff = easy_smooth(select_xoff, 0, 4);
select_yoff = easy_smooth(select_yoff, 0, 4);

for (var i = 0; i < 5; i++)
{
    if (in[i])
    {
        xscale[i] = easy_smooth(xscale[i], 1, 5);
        yscale[i] = easy_smooth(yscale[i], 1, 5);
    }
}

if (input_check_pressed("jump") && !done && all_in)
{
    done = true;
    xscale[selected] = 0.7;
    yscale[selected] = 0.7;
    select_xoff = 40;
    select_yoff = 0;
    timer[2] = 60;
}
