testvariablenothing = false;
x += global.microgame_hspd;

if (bbox_right < -100)
    instance_destroy();

vspd += (grav * global.delta_game_factor);
y += (vspd * global.delta_game_factor);

if (place_meeting(x, y, obj_macro_knives_ground))
{
    while (place_meeting(x, y, obj_macro_knives_ground))
        y += side;
    
    vspd = jump_strength * side;
}
