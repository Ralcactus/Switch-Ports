state_prev = state;
spr_prev = anim_sprite;
ind_prev = anim_index;

if (newPowerup == 1)
{
    state = state_powerup;
    anim_play(spr_buster_powerup_rocket);
}

if (newPowerup == 4)
{
    state = state_powerup;
    anim_play(spr_buster_powerup_nuclear);
}
