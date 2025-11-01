anim_logic();

if (place_meeting_micro(x, y, obj_micro_jetpack_buster))
{
    var _inst = instance_create_micro(x, y, "Over1", obj_micro_jetpack_star_collect);
    _inst.anim_sprite = spr_micro_jetpack_star_collect;
    _inst.anim_index = anim_index;
    var _snd = audio_play_sound_on(controller.audio, snd_micro_jetpack_star, false, 0);
    audio_sound_pitch(_snd, choose(1, 1.05, 1.1));
    controller.zoom = 0.99;
    instance_destroy();
    var _exists = false;
    
    with (obj_micro_jetpack_star)
    {
        if (ID == other.ID)
            _exists = true;
    }
    
    if (!_exists && !controller.win)
    {
        scr_micro_win();
        controller.zoom = 0.95;
        
        with (obj_micro_jetpack_moon)
        {
            if (ID == other.ID)
            {
                anim_play(spr_micro_jetpack_moonwin);
                audio_play_sound_on(controller.audio, snd_belltree_retro, false, 0);
                timer[0] = 15;
            }
        }
    }
}

scale = easy_smooth(scale, 1, 2.5);
