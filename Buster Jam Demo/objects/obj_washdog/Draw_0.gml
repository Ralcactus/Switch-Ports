var _texbefore = gpu_get_texfilter();
gpu_set_texfilter(false);
draw_sprite(spr_br_washdog, 0, x, y);
draw_sprite(anim_sprite, anim_index, x, y);

if (controller.win)
    exit;

if (!surface_exists(surf))
    surf = surface_create(sprite_width, sprite_height);

surface_set_target(surf);
draw_clear_alpha(c_lime, 0);
draw_sprite(spr_br_washdog_dirty, dirty_ind, 0, 0);
surface_reset_target();

if (!surface_exists(surf2))
    surf2 = surface_create(sprite_width, sprite_height);

surface_set_target(surf2);
draw_sprite_ext(spr_br_washdog_sponge_mask, 0, obj_washdog_sponge.x - x, obj_washdog_sponge.y - y, 1, 1, 0, c_lime, 1);
surface_reset_target();

if (!surface_exists(surf3))
    surf3 = surface_create(sprite_width, sprite_height);

surface_set_target(surf3);
draw_surface(surf, 0, 0);
draw_surface(surf2, 0, 0);
surface_reset_target();
gpu_set_texfilter(global.texfilter);
pal_swap(pal_greenscreen, 0, 1);
draw_surface(surf3, x, y);
pal_swap_reset();
