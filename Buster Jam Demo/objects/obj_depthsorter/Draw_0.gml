for (var i = 0; i < array_length(objs); i++)
{
    with (objs[i])
        event_perform(ev_draw, ev_draw_normal);
}
