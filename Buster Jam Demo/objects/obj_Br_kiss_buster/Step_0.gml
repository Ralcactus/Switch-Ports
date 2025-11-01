anim_logic();
shake = approach(shake, 0, 0.125);

if (controller.win)
{
    effect_alpha = approach(effect_alpha, 0, 0.05);
    effect_scale += (0.06 * global.delta_game_factor);
}

timer_logic(0);
