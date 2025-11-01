if (death)
    exit;

anim_index += 1.6;

if (anim_index >= sprite_get_number(anim_sprite))
{
    anim_speed = 1;
    anim_play(spr_micro_pistol_demon_death);
    death = true;
    scr_micro_win();
    
    with (obj_micro_pistol)
    {
        if (ID == other.ID)
        {
            anim_play(spr_micro_pistol_win);
            deac = true;
        }
    }
    
    instance_create_micro(358, -818, layer, obj_micro_pistol_angel);
    var _target = 60 * time_bpm_to_seconds(140) * 4;
    var _beat = 60 * time_bpm_to_seconds(140);
    
    with (controller)
    {
        event_round_time(6);
        timer_alpha_override = 0;
    }
}
