testvariablenothing = false;
vspd += (grav * global.delta_game_factor);
y += (vspd * global.delta_game_factor);

if (vspd >= 7)
{
    anim_play(spr_fx_sparkle);
    grav = 0;
    vspd = 0;
}

anim_logic();
anim_speed += (0.08 * global.delta_game_factor);
