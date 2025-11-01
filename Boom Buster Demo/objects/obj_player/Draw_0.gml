var _alpha;

if (invulnerable)
    _alpha = 0.9 - (invulnerable_flash * 0.25);
else
    _alpha = image_alpha;

var _cannonscale;

if (my_cannon != -4)
    _cannonscale = my_cannon.scale;
else
    _cannonscale = 1;

pal_swap(pal_buster, 0, myPal);
draw_sprite_ext(anim_sprite, anim_index, x, y, _cannonscale * facing, _cannonscale * 1, 0, image_blend, _alpha);
shader_reset();
