if (obj_player.grounded)
{
    if (inv_frame == 0 && obj_player.state != 17 && obj_player.state != 6 && obj_player.state != 8 && obj_player.state != 5 && obj_player.state != 18 && obj_player.state != 11 && obj_player.state != 70)
    {
        instance_destroy();
        global.key_inv = 1;
        obj_player.key_particles = 1;
        obj_player.alarm[7] = 30;
    }
    
    if (global.keyget == 0 && obj_player.state != 17 && obj_player.state != 18 && obj_player.state != 8 && obj_player.state != 5 && obj_player.state != 11)
    {
        scr_sound(73);
        obj_player.state = 53;
        obj_player.image_index = 0;
        global.keyget = 1;
        scr_queue_tvanim(467, 200);
    }
}
