if (splatted)
{
    var _gw = get_game_width();
    var _gh = get_game_height();
    var _sw = sprite_get_width(spr_player_hdsplat);
    var _sh = sprite_get_height(spr_player_hdsplat);
    var _x = (_gw - (_sw * splatscale)) / 2;
    var _y = ((_gh - (_sh * splatscale)) / 2) + splattedy;
    pal_swap_set(palettespr, curpalette, false);
    draw_sprite_stretched_ext(spr_player_hdsplat, 0, _x, _y, _sw * splatscale, (_sh * splatscale) + stretch, c_white, 1);
    pal_swap_reset();
    
    if (!surface_exists(surf))
    {
        surface_depth_disable(true);
        surf = surface_create(_gw, _gh, surface_fallback(surface_r8unorm));
        surface_depth_disable(false);
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
    }
    else
        surface_set_target(surf);
    
    shader_set(shd_smudge_set);
    draw_sprite_stretched_ext(spr_player_hdsplat, 0, _x, _y, _sw * splatscale, (_sh * splatscale) + stretch, c_red, 1);
    surface_reset_target();
    shader_reset();
    var _tex = surface_get_texture(surf);
    shader_set(shd_smudge_premultiply);
    shader_set_uniform_f(texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
    shader_set_uniform_f(radius, 8);
    draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 0.1);
    shader_set(shd_premultiply);
}
