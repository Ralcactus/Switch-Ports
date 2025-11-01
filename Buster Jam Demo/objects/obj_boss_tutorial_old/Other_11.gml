draw_set_alpha(overlay_alpha);
var _col = 4325632;
draw_rectangle_color(0, 0, 1920, 1080, _col, _col, _col, _col, false);
draw_set_alpha(1);

if (!surface_exists(surf_trans))
    surf_trans = surface_create(1920, 1080);

surface_set_target(surf_trans);
draw_sprite(spr_tutorial_trans_bg, 0, 0, 0);
var _xoff = sprite_get_xoffset(spr_tutorial_trans_bombs);
var _yoff = sprite_get_yoffset(spr_tutorial_trans_bombs);
draw_sprite_ext(spr_tutorial_trans_bombs_back, 0, _xoff, _yoff, bomb_pile_xscale, bomb_pile_yscale, 0, c_white, 1);

if (!bomb_done && bomb_layer == 1)
{
    pal_swap(spr_tutorial_trans_bomb_pal, 0, bomb_col);
    draw_sprite_ext(spr_tutorial_trans_bomb, 0, bomb_x, bomb_y, bomb_scale, bomb_scale, bomb_rot, c_white, 1);
    shader_reset();
}

draw_sprite_ext(spr_tutorial_trans_bombs, 0, _xoff, _yoff, bomb_pile_xscale, bomb_pile_yscale, 0, c_white, 1);
draw_sprite(spr_tutorial_trans_tubes_behind, 0, 0, 0);
draw_sprite(spr_tutorial_trans_tubes, 0, 0, 0);
_xoff = sprite_get_xoffset(spr_tutorial_trans_machine) + 11;
_yoff = sprite_get_yoffset(spr_tutorial_trans_machine);
sirens_ind += ((sprite_get_speed(spr_tutorial_trans_sirens) / 60) * global.delta_game_factor);
var _win = false;
var _spr;

if (_win)
    _spr = spr_tutorial_trans_sirens_yay;
else
    _spr = spr_tutorial_trans_sirens;

draw_sprite_ext(_spr, sirens_ind, _xoff, _yoff - 12, machine_xscale, machine_yscale, 0, c_white, 1);
draw_sprite_ext(spr_tutorial_trans_machine, 0, _xoff, _yoff - 12, machine_xscale, machine_yscale, 0, c_white, 1);
_xoff = sprite_get_xoffset(buster_sprite);
_yoff = sprite_get_yoffset(buster_sprite);
var _xscale = 1;
var _yscale = 1;
draw_sprite_ext(buster_sprite, buster_ind, _xoff, _yoff, _xscale, _yscale, 0, c_white, 1);
draw_sprite(spr_tutorial_trans_belt, belt_ind, 0, 0);

if (bomb_fresh)
{
    pal_swap(spr_tutorial_trans_bomb_pal, 0, bomb_col);
    draw_sprite_ext(spr_tutorial_trans_bomb, 0, 960, bomb_fresh_y, bomb_fresh_scale, bomb_fresh_scale, 0, c_white, bomb_fresh_alpha);
    shader_reset();
}

if (!bomb_done && bomb_layer == 0)
{
    pal_swap(spr_tutorial_trans_bomb_pal, 0, bomb_col);
    draw_sprite_ext(spr_tutorial_trans_bomb, 1, bomb_x, bomb_y, bomb_scale, bomb_scale, bomb_rot, c_white, 1);
    shader_reset();
}

bomb_x += (bomb_hspd * global.delta_game_factor);
bomb_y += (bomb_vspd * global.delta_game_factor);
surface_reset_target();
var _x = 960 - (960 * scale_trans);
var _y = 540 - (540 * scale_trans);
pal_swap(spr_tutorial_trans_pal, 0, 1);
draw_surface_ext(surf_trans, _x, _y - (78 * (scale_trans - 1)), scale_trans, scale_trans, 0, c_white, 1);
shader_reset();
