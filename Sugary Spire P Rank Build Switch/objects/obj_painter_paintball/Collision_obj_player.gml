with (obj_player)
{
    player_x = x;
    state = states.bushdisguise;
    sprite_index = spr_player_frothstuck;
    bushdisguise = 0;
    bushdetection = 12;
    hp -= 1;
}

instance_destroy();
