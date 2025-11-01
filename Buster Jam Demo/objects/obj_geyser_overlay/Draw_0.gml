testvariablenothing = false;
get_cams();
draw_set_alpha(flash_alpha);
draw_rectangle(camx, camy, camx + 1920, camy + 1080, false);
draw_set_alpha(1);
flash_alpha = approach(flash_alpha, 0, 0.05);

with (obj_map_actor)
{
    var _before = image_blend;
    var _alpha_before = image_alpha;
    image_blend = c_black;
    image_alpha = other.flash_alpha;
    event_perform(ev_draw, ev_draw_normal);
    image_blend = _before;
    image_alpha = _alpha_before;
}
