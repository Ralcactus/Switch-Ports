if (spinning || spin_bounce)
    anim_play(spr_micro_jetpack_buster_spin);
else if (hspd != 0 || vspd != 0)
    anim_play(spr_micro_jetpack_buster_move);
else
    anim_play(spr_micro_jetpack_buster_idle);
