if (!ready)
    exit;

if (view_current == view && draw_instances)
{
    get_cams(1);
    draw_rectangle_color(-400, -400, room_width + 400, room_height + 400, c_black, c_black, c_black, c_black, false);
    
    for (var i = 0; i < array_length(instances); i++)
    {
        with (instances[i])
            event_perform(ev_draw, ev_draw_normal);
    }
}
