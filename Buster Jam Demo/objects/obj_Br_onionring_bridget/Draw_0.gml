if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
draw_clear_alpha(c_lime, 0);
draw_sprite(anim_sprite, anim_index, x, y);

with (obj_Br_onionring)
{
    draw = true;
    event_perform(ev_draw, ev_draw_normal);
    draw = false;
}

if (anim_sprite == spr_Br_onionring_bridget)
    draw_sprite(spr_Br_onionring_bridget_teeth, anim_index, x, y);

with (obj_fakeparticle_microgame)
{
    visible = false;
    event_perform(ev_draw, ev_draw_normal);
}

surface_reset_target();
draw_surface_ext(surf, 15, 8, 1, 1, 0, c_black, 0.4);
draw_surface(surf, 0, 0);
