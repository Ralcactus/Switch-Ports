function draw_sprite_billboard_ext(_sprite, _index, _x, _y, _z, _xscale, _yscale, _rot, _col, _alpha, _usepal)
{
    shader_set(shd_billboard);
    
    if (_usepal == true)
        pal_swap_set(palettespr, curpalette, false);
    
    matrix_set(2, matrix_build(_x, _y, _z, 0, 0, 0, 1, 1, 1));
    draw_sprite_ext(_sprite, _index, 0, 0, _xscale, _yscale, _rot, _col, _alpha);
    matrix_set(2, matrix_build_identity());
    shader_reset();
}

function draw_sprite_3d_ext(_sprite, _index, _x, _y, _z, _xscale, _yscale, _rot, _col, _alpha)
{
    matrix_set(2, matrix_build(_x, _y, _z, 0, 0, 0, 1, 1, 1));
    draw_sprite_ext(_sprite, _index, 0, 0, _xscale, _yscale, _rot, _col, _alpha);
    matrix_set(2, matrix_build_identity());
}

function draw_text_billboard(_x, _y, _z, _str, _xscale, _yscale, _angle, _c1 = draw_get_colour(), _c2 = draw_get_colour(), _c3 = draw_get_colour(), _c4 = draw_get_colour(), _alpha = draw_get_alpha())
{
    shader_set(shd_billboard);
    matrix_set(2, matrix_build(_x, _y, _z, 0, 0, 0, 1, 1, 1));
    __draw_text_transformed_colour_hook(0, 0, _str, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
    matrix_set(2, matrix_build_identity());
    shader_reset();
}
