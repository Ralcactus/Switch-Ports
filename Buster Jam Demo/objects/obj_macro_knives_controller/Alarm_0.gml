testvariablenothing = false;

if (intro)
{
    zoom = intro_zoom;
    zoom_to = intro_zoom;
    instance_create_layer(0, 0, "Instances", obj_macro_knives_cutscene);
    
    if (instance_exists(obj_macro_knives_intro))
        boss_intro_y = -600;
    else
        boss_intro_y = 0;
}
else
{
    with (obj_macro_knives_player)
        deac = false;
}
