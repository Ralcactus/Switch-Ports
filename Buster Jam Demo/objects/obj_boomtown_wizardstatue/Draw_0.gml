var _strength = 10;
var _x = x + random_range(-shake * _strength, shake * _strength);
var _y = y + (random_range(-shake * _strength, shake * _strength) * 0.4);
draw_sprite_ext(sprite_index, image_index, _x, _y, 1, 1, 0, c_white, 1);

if (room != rm_wizard_test)
    exit;

for (var i = 0; i < array_length(explosion_positions); i++)
{
    draw_set_color(c_red);
    draw_sprite_ext(spr_fx_explosion, 7, explosion_positions[i][0], explosion_positions[i][1], 1, 1, 0, c_white, 0.2);
    draw_set_color(c_white);
}

draw_sprite_ext(spr_fx_explosion, 7, mouse_x, mouse_y, 1, 1, 0, c_white, 0.2);
x = 0;
y = 0;
