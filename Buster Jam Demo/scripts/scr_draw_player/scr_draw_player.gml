function scr_draw_player()
{
    if (hurt)
        exit;
    
    var _y, _x, _z;
    
    if (global.cutscene_swap)
    {
        _x = swap_x;
        _y = swap_y;
        _z = swap_z;
    }
    else
    {
        _x = x;
        _y = y;
        _z = z;
    }
    
    var _yoff = 0;
    _y += _yoff;
    var _alpha = 1;
    
    if (invulnerable)
        _alpha = 0.85 - (0.2 * invulnerable_flash);
    
    draw_sprite_ext(anim_sprite, anim_index, _x, _y + _z, facing, 1, 0, image_blend, _alpha);
}
