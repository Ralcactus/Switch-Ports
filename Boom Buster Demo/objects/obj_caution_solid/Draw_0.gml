var _x = x - ((64 * image_xscale) / 2);

for (var i = 0; i < image_xscale; i++)
{
    var _ind;
    
    if (i == 0)
        _ind = 0;
    else if (i == (image_xscale - 1))
        _ind = 2;
    else
        _ind = 1;
    
    draw_sprite_ext(sprite_index, _ind, _x + (64 * i), y, 1, 1, 0, c_white, 1);
}
