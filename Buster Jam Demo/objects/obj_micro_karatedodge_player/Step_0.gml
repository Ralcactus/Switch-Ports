var _grounded = on_ground_micro();

if (_grounded && input_check_pressed("down", player) && !slide)
{
    slide = true;
    timer[0] = slide_time;
    my_slide_snd = audio_play_sound_on(controller.audio, snd_micro_karatedodge_slide, false, 0);
}

timer_logic(0);

if (_grounded && (input_check_pressed("jump", player) || input_check_pressed("up", player)))
{
    if (!(slide && place_meeting_micro(x, y - 80, obj_micro_karatedodge_ceiling)))
    {
        vspd = -jump_strength;
        slide = false;
        timer[0] = -1;
        audio_play_sound_on(controller.audio, snd_micro_karatedodge_jump, false, 0);
        
        if (audio_is_playing(my_slide_snd))
        {
            audio_stop_sound(my_slide_snd);
            my_slide_snd = -4;
        }
    }
}

if (slide)
    mask_index = spr_micro_karatedodge_mask_slide;
else
    mask_index = spr_micro_karatedodge_mask;

if (slide)
    anim_play(spr_micro_karatedodge_slide);
else if (_grounded)
    anim_play(spr_micro_karatedodge_run);
else
    anim_play(spr_micro_karatedodge_jump);

anim_logic();
physics_apply_2d_micro();

if (place_meeting_micro(x, y, obj_micro_karatedodge_spikes) && !controller.ended)
{
    var _inst = instance_create_micro(x, y + 8, layer, obj_micro_karatedodge_player_death);
    _inst.sprite_index = anim_sprite;
    _inst.image_index = anim_index;
    
    if (place_meeting_micro(x, y, obj_micro_karatedodge_ceiling))
        _inst.death_ind = 1;
    
    with (controller)
        event_set_time(5, true);
    
    if (audio_is_playing(my_slide_snd))
        audio_stop_sound(my_slide_snd);
    
    controller.microgame_hspd = 0;
    audio_play_sound_on(controller.audio, snd_ouch, 0, 0);
    controller.win = false;
    instance_destroy();
}
