var _ind = anim_index;
anim_logic();

if (_ind < 2 && anim_index >= 2 && (anim_sprite == spr_Bu_smash_run || anim_sprite == spr_Bu_smash_yooo))
    audio_play_sound_on(controller.audio, snd_Bu_smash_step, 0, 0);

timer_logic(0);

if (input_check_pressed("jump", player) && !spun && !dead && !win)
{
    audio_play_sound_on(controller.audio, snd_spin, 0, 0);
    spin = true;
    spun = true;
    anim_play(spr_Bu_smash_spin);
    timer[0] = 25;
}

if (dead)
{
    vspd += (1.85 * global.delta_game_factor);
    hspd = -8.5;
    image_angle += 8;
    x += (hspd * global.delta_game_factor);
    y += (vspd * global.delta_game_factor);
}

if (place_meeting_micro(x, y, obj_Bu_smash_brick))
{
    if (dead)
        exit;
    
    if (!spin)
    {
        other.hspd = 0;
        dead = true;
        controller.microgame_hspd = 0;
        instance_find_micro(obj_Bu_smash_brick).hspd = 0;
        y -= 280;
        vspd = -18;
        anim_play(spr_Bu_smash_dead);
        audio_play_sound_on(controller.audio, snd_ouch, 0, 0);
        audio_play_sound_on(controller.audio, voice_buster_scream, 0, 0);
        instance_find_micro(obj_Bu_smash_bg).bg_index = 2;
    }
    else
    {
        var _inst = instance_create_layer(bbox_right, y - 258, "Over1", obj_fakeparticle_microgame);
        
        with (_inst)
            anim_play(spr_Bu_smash_bam);
        
        _inst.ID = ID;
        _inst.controller = controller;
        
        with (instance_find_micro(obj_Bu_smash_brick))
        {
            event_user(0);
            instance_destroy();
        }
        
        scr_micro_win();
        instance_find_micro(obj_Bu_smash_bg).bg_index = 1;
    }
}
