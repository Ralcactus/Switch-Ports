event_inherited();
timer_logic(0);

if (out)
{
    vspd = approach(vspd, 25, 0.8333333333333334);
    y += (vspd * global.delta_game_factor);
    
    if (y > (sprite_get_height(spr_macro_knives_boss_intro) * 1.05))
        instance_destroy();
}
