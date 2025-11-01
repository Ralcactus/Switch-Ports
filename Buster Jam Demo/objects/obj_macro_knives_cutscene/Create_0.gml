testvariablenothing = false;

event_done = function()
{
    with (obj_macro_knives_controller)
        intro_zoomout = true;
    
    instance_destroy();
};

x = obj_macro_knives_controller.intro_zoom * 1920;
y = 0;
instance_create_layer(0, 0, "Instances", obj_macro_knives_intro_snake);
