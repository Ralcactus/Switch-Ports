testvariablenothing = false;
draw_set_font(fnt_adlib_44);

if (failed)
{
    if (!surface_exists(surf))
        surf = surface_create(1920, 1080);
    
    surface_set_target(surf);
    draw_sprite_ext(spr_popup, 0, 960, 540, 9, 5, 0, c_white, 1);
    draw_set_font(fnt_adlib_44);
    draw_set_halign(fa_center);
    draw_text(960, 150, "- A communication error occurred. -");
    draw_set_valign(fa_middle);
    _str = "Could not connect to the internet.\nTo use networking features, please ensure a stable internet connection, or try again later. You may need to re-open the game.";
    draw_text_ext(960, 540, _str, 100, 1500);
    draw_set_valign(fa_top);
    var _x = 875;
    var _y = 878;
    draw_text(960, 850, "Press         to Continue");
    draw_sprite_ext(scr_get_glyph(spr_glyph_gp_cross), global.keyboard, _x, _y, 1, 1, 0, c_white, 1);
    draw_set_halign(fa_left);
    surface_reset_target();
    percent_zoom = approach(percent_zoom, 1, 0.05);
    zoom = use_curve(acurv_elastic_less, percent_zoom, undefined, 0.2, 1);
    var _w = 1920;
    var _h = 1080;
    _x = 0 + ((_w / 2) * (1 - zoom));
    _y = 0 + ((_h / 2) * (1 - zoom));
    draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
}

if (!failed && !done)
{
    loading_angle += ((sprite_get_speed(spr_map_buster_walk) / 60) * global.delta_game_factor);
    shader_set(sha_flash);
    draw_sprite_ext(spr_map_buster_walk, loading_angle, 1795, 1030, 1, 1, 0, c_white, 1);
    shader_reset();
}
