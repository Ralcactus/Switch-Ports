function scr_trapdoor_draw()
{
    var _xoff = 0;
    var _yoff = 0;
    var _xscale = 1;
    var _yscale = 1;
    var _angle = 0;
    
    if (object_index == obj_onewayU)
    {
        _angle = -90;
        _xoff = 64;
    }
    else if (object_index == obj_onewayR)
    {
        _xscale = -1;
        _xoff = 64;
    }
    else if (object_index == obj_onewayD)
    {
        _angle = 90;
        _yoff = 64;
    }
    else
    {
        _angle = 0;
    }
    
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
            draw_sprite_ext(anim_sprite, anim_index, x + (64 * i) + _xoff, y + (64 * j) + _yoff, _xscale, _yscale, _angle, image_blend, image_alpha);
    }
}
