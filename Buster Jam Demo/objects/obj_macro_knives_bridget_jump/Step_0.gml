testvariablenothing = false;
anim_logic();
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
vspd += (grav * global.delta_game_factor);

if (x < (obj_macro_knives_player.x + 96))
{
    with (obj_macro_knives_player)
        event_catch();
    
    instance_destroy();
}
