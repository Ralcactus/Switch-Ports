testvariablenothing = false;
anim_logic();

if (anim_index >= 5 && !debugging)
{
    if (my_actor)
        instance_destroy(my_actor);
}

flash_alpha -= (0.0125 * global.delta_game_factor);
flash_scale += (0.005 * global.delta_game_factor);
