var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
draw_set_alpha(alpha);
draw_rectangle(-256, 0, 1664, 1080, false);
draw_set_alpha(1);

with (obj_lightning)
    draw_sprite_ext(anim_sprite, anim_index, (-256 + x) - _camx, y - _camy, 1, 1, 0, c_black, image_alpha);

with (obj_player)
    draw_sprite_ext(anim_sprite, anim_index, (-256 + x) - _camx, y - _camy, facing, 1, 0, c_black, other.alpha);
