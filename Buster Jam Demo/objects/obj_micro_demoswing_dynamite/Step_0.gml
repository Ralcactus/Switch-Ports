x += (hspd * global.delta_game_factor * mult);
y += (vspd * global.delta_game_factor * mult);
vspd += (grav * global.delta_game_factor * mult);

if (y > (controller.game_height + 300))
    instance_destroy();

if (missed)
    exit;

var _man = instance_find_micro(obj_micro_demoswing_man);

if (place_meeting_micro(x, y, _man) && _man.swing_mask)
{
    var _fx = instance_create_micro(_man.x, _man.y, "Middle", obj_micro_demoswing_fx);
    
    with (_fx)
        anim_play(spr_micro_demoswing_hitfx);
    
    audio_play_sound_on(controller.audio, snd_micro_demoswing_batsmack, false, 0);
    
    with (controller)
    {
        screenshake[0] = 6;
        screenshake[1] = 6;
    }
    
    instance_create_micro(x, y, "Behind", obj_micro_demoswing_dynamite_hit);
    
    with (_man)
    {
        hits++;
        hit_something = true;
        
        if (hits == hits_needed)
        {
            scr_micro_win();
            deac = true;
            instance_find_micro(obj_micro_demoswing_bg).timer[0] = -1;
            
            with (obj_micro_demoswing_dynamite)
            {
                if (ID == other.ID)
                    instance_destroy();
            }
        }
    }
    
    instance_destroy();
    exit;
}

var _bg = instance_find_micro(obj_micro_demoswing_bg);

if (bbox_right < (instance_find_micro(obj_micro_demoswing_man).bbox_right - 80))
{
    if (ending)
    {
        var _fx = instance_create_micro(0, 0, layer, obj_micro_demoswing_fx);
        
        with (_fx)
            anim_play(spr_micro_demoswing_explosion);
        
        audio_play_sound_on(controller.audio, snd_explosion, false, 0);
        
        with (controller)
        {
            screenshake[0] = 24;
            screenshake[1] = 24;
            zoom = 0.9;
        }
        
        instance_create_micro(0, 0, "Over1", obj_micro_demoswing_fail);
        instance_destroy();
    }
    else
    {
        missed = true;
        _bg.balls++;
        
        if (_bg.timer[0] == -1)
            _bg.timer[0] = irandom_range(30, 60);
        
        with (_bg)
            event_miss();
    }
}
