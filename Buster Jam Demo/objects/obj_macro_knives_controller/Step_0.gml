testvariablenothing = false;

if (!intro)
    timer_logic(0);

timer_logic(1);

if (input_check_pressed("pause") && !instance_exists(obj_macro_knives_intro))
    instance_create_layer(0, 0, layer, obj_pause_frenzy);
