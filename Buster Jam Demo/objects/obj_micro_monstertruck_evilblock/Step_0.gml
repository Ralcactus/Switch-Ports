if (deac)
    exit;

x = xstart + (sin(pi * time) * 6.5);
time += (0.035 * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
anim_logic();

if (place_meeting_micro(x, y, obj_micro_monstertruck_cannonball) && !hit)
{
    hit = true;
    event_user(0);
}

with (instance_find_micro(obj_micro_monstertruck))
    mask_index = spr_micro_monstertruck_hurtmask;

if (place_meeting_micro(x, y, obj_solid_micro) || place_meeting_micro(x, y, obj_micro_monstertruck))
{
    instance_create_micro(x, y, layer, obj_micro_monstertruck_blockrage);
    controller.win = false;
    
    with (controller)
        event_set_time(5);
    
    with (obj_micro_monstertruck)
    {
        if (ID == other.ID)
        {
            deac = true;
            
            if (audio_is_playing(my_drive_snd))
                audio_stop_sound(my_drive_snd);
            
            timer[0] = -1;
        }
    }
    
    with (obj_micro_monstertruck_evilblock)
    {
        if (ID == other.ID)
            deac = true;
    }
    
    instance_destroy();
}

with (instance_find_micro(obj_micro_monstertruck))
    mask_index = spr_micro_monstertruck_mask;
