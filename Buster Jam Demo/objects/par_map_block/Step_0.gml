if (scr_map_exit_freeze())
    exit;

anim_logic();
time += global.delta_game_factor;
z_hit_spd += (z_hit_grav * global.delta_game_factor);
z_hit += (z_hit_spd * global.delta_game_factor);

if (z_hit > 0)
{
    z_hit = 0;
    z_hit_spd = 0;
    z_hit_grav = 0;
    hit = false;
}

timer_logic(0);
