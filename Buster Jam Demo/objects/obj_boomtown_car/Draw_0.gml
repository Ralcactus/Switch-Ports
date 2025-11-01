pal_swap(pal, 0, pal_index);
draw_sprite_ext(anim_sprite, anim_index, x, y, facing, 1, 0, c_white, 1);
pal_swap_reset();

if (anim_sprite == spr_boomtown_car_ad)
{
    var _ymove;
    
    if (anim_index >= 0 && anim_index < 1)
        _ymove = 0;
    else
        _ymove = 2;
    
    var _xmove;
    
    if (facing == -1)
        _xmove = 262;
    else
        _xmove = 0;
    
    draw_sprite_ext(spr_boomtown_car_ads, ad_index, x + _xmove, y + _ymove, 1, 1, 0, c_white, 1);
}
