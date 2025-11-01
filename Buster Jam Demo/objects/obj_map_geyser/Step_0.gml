testvariablenothing = false;
time += (global.delta_game_factor * 0.05);

if (keyboard_check_pressed(vk_space) && global.debug)
{
    if (instance_exists(obj_geyser_overlay))
        instance_destroy(obj_geyser_overlay);
    
    instance_create_layer(0, 0, "GUI", obj_geyser_overlay);
}

flash_alpha = approach(flash_alpha, 0, 0.016666666666666666);
