draw_self();

for (var i = 0; i < array_length(draw_order); i++)
{
    if (!instance_exists(draw_order[i]))
        continue;
    
    draw_sprite_ext(draw_order[i].sprite_index, 0, draw_order[i].x, draw_order[i].y, draw_order[i].xscale, draw_order[i].yscale, 0, c_white, 1);
}

if (array_length(draw_order) >= 3 && instance_exists(draw_order[3]) && draw_order[3].y > (y - 1200) && !timer_in)
{
    with (controller)
    {
        event_set_time(7);
        timer_alpha_override = 1;
    }
    
    timer_in = true;
}
