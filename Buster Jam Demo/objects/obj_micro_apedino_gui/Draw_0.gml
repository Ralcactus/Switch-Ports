get_cams(1);
draw_sprite(spr_micro_apedino_ui, !controller.win, camx + 15, camy + 3);
draw_sprite(spr_micro_apedino_ui_power, 0, camx + 31, camy + 431);
var _xshake, _yshake;

if (lose_alpha == 1)
{
    _xshake = irandom_range(-1, 1);
    _yshake = irandom_range(-1, 1);
}
else
{
    _xshake = 0;
    _yshake = 0;
}

draw_sprite_ext(spr_micro_apedino_dinowin, 0, _xshake + camx + (controller.game_width / 2), _yshake + camy + 98 + (sprite_get_height(spr_micro_apedino_dinowin) / 2), lose_scale, lose_scale, 0, c_white, lose_alpha);
