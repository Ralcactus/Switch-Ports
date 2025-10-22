function _mbuff_rotate_sprite(arg0)
{
    var spr = arg0;
    var w = sprite_get_width(spr);
    var h = sprite_get_height(spr);
    var s = surface_create(h, w);
    matrix_set(0, matrix_build_identity());
    matrix_set(2, matrix_build_identity());
    gpu_set_cullmode(0);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    draw_set_color(c_white);
    draw_set_alpha(1);
    surface_set_target(s);
    draw_clear_alpha(c_white, 0);
    draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr, 0));
    draw_vertex_texture(0, 0, 1, 0);
    draw_vertex_texture(h, 0, 1, 1);
    draw_vertex_texture(0, w, 0, 0);
    draw_vertex_texture(h, w, 0, 1);
    draw_primitive_end();
    surface_reset_target();
    var newSpr = sprite_create_from_surface(s, 0, 0, h, w, 0, 0, 0, 0);
    surface_free(s);
    gpu_set_blendmode(bm_normal);
    return newSpr;
}
