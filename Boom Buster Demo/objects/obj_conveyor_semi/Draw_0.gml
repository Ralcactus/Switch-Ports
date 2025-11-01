for (var i = 0; i < image_xscale; i++)
{
    var _spr;
    
    if (i == 0)
        _spr = spr_conveyor_left;
    else if (i == (image_xscale - 1))
        _spr = spr_conveyor_right;
    else
        _spr = spr_conveyor_middle;
    
    draw_sprite_ext(_spr, anim_index, x + (64 * i), y, 1, 1, 0, c_white, image_alpha);
}
