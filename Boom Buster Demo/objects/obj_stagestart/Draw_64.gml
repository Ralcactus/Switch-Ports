if (!instance_exists(id))
    exit;

zoom = obj_controller.zoom;
get_cams();

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_splatter_55);
draw_text_shake(960, 540 - (60 * display_act), string("{0} {1} {2}", "\"", global.act_name, "\""));

if (display_act)
{
    draw_set_font(fnt_splatter_85);
    draw_text_shake(960, 600, string("ACT {0}/{1}", global.act, global.acts));
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
gpu_set_blendmode(bm_subtract);
var _x = (obj_player.x * zoom) - (camx * zoom);
var _y = (obj_player.y * zoom) - (camy * zoom);
draw_circle(_x, _y - (40 * zoom), radius + radius_add, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_alpha(fade_alpha);
draw_surface(surf, -256, 0);
draw_set_alpha(1);
