var _alpha = draw_get_alpha();
draw_set_alpha(alpha);
var _wave = wave(-4, 4, 3, 0);

if (place_meeting_collision(x, y + 1))
    draw_triangle_color(x + _wave, y + sprite_height, x + (sprite_width / 2), y - sprite_width - 80, x + sprite_width + _wave, y + sprite_height, c_white, 16777215, 16777215, false);
else
    draw_circle_color(x + _wave + (sprite_width / 2), y + wave(-4, 4, 5, 0) + (sprite_height / 2), sprite_width, c_white, c_white, false);

draw_set_alpha(_alpha);
