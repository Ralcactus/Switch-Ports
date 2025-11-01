anim_logic();

if (done)
    exit;

if (input_check_pressed("jump") || input_check_pressed("down"))
{
    var _spr;
    
    if (place_meeting(x, y, obj_Br_onionring))
    {
        _spr = spr_Br_onionring_particles;
        audio_play_sound_on(controller.audio, snd_munch, 0, 0);
        anim_play(spr_Br_onionring_bridget_yum);
        
        with (obj_Br_onionring)
        {
            anim_play(spr_Br_onionring_win);
            x += 436;
            yoff = 15;
        }
        
        scr_micro_win();
    }
    else
    {
        _spr = spr_Br_onionring_teeth_particles;
        audio_play_sound(snd_shatter, 0, 0);
        anim_play(spr_Br_onionring_bridget_ouch);
    }
    
    for (var i = 0; i < 5; i++)
    {
        for (var j = 0; j < 2; j++)
        {
            var _y;
            
            if (j == 0)
                _y = 514 + irandom_range(-8, 8);
            else
                _y = 623 + irandom_range(-8, 8);
            
            _y += 15;
            var _x;
            
            if (controller.win)
                _x = x + 259 + (60.6 * i) + 18 + 220;
            else
                _x = x + 259 + (60.6 * i) + 18;
            
            var _inst = instance_create_layer(_x, _y, "Over1", obj_fakeparticle_microgame);
            _inst.grav = random_range(0.8, 1);
            _inst.vspd = random_range(0, -10);
            _inst.hspd = random_range(-7, 7);
            _inst.anim_end_die = false;
            _inst.anim_speed = 0;
            _inst.anim_sprite = _spr;
            _inst.anim_index = irandom_range(0, sprite_get_number(_inst.anim_sprite) - 1);
            _inst.rot_spd = random_range(-4, 4);
            _inst.controller = controller;
            _inst.ID = ID;
        }
    }
    
    done = true;
}
