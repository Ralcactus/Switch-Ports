draw_sprite_ext(spr_micro_cratememory_bg, 0, 0, 0, 100, 100, 0, c_white, 1);
var _w = sprite_get_width(spr_micro_cratememory_bg1);
var _h = sprite_get_height(spr_micro_cratememory_bg1);

for (var i = 0; i < 15; i++)
{
    _x = 0;
    _y = (_h * i) - bg_y;
    draw_sprite(spr_micro_cratememory_bg1, 0, _x, _y);
    _x = controller.game_width - _w;
    _y = ((controller.game_height + _h) - (_h * i)) + bg_y;
    draw_sprite(spr_micro_cratememory_bg1, 1, _x, _y);
}

bg_y += (2 * global.delta_game_factor);

if (bg_y > _h)
    bg_y -= _h;

draw_set_font(global.font_splash);
draw_set_alpha(splash_alpha);
var _str = "PICK ONE!";
var _scale = 0.52;
var _x = (controller.game_width / 2) - ((string_width(_str) * _scale) / 2);
var _y = 35;

for (var i = 0; i < string_length(_str); i++)
{
    var _chr = string_char_at(_str, i + 1);
    draw_text_transformed(_x + random_range(-1, 1), _y + random_range(-1, 1), _chr, _scale, _scale, 0);
    _x += (string_width(_chr) * _scale);
}

draw_set_alpha(1);

if (buster_in)
{
    buster_ind += ((sprite_get_speed(buster_spr) / 60) * global.delta_game_factor);
    
    if (buster_ind >= sprite_get_number(buster_spr))
        event_animend_buster();
    
    draw_sprite(buster_spr, buster_ind, ((controller.game_width / 2) - 20) + buster_x + controller.screenshake_draw[0], buster_y + 22 + controller.screenshake_draw[1]);
    
    if (smash == -4)
        draw_sprite_ext(spr_micro_cratememory_bg, 0, 300, 520, 14, 100, 0, c_white, 1);
}
