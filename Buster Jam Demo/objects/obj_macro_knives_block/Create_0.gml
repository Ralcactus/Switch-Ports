testvariablenothing = false;
event_inherited();
turnX = 0;
turnY = 0;
turnY_yoff = 0;
time = 0;
cube_size = 100;
cube_sprite = spr_macro_knives_block;
sprite_index = mask_index;
image_xscale = 1.2;
image_yscale = 1;
glyph = false;

event_spun = function()
{
    var _count = irandom_range(9, 11);
    
    for (var i = 0; i < _count; i++)
    {
        var _subimg = irandom_range(0, sprite_get_number(spr_macro_knives_crateshards) - 1);
        var _x = ((x + irandom_range(-70, 70)) - 120) + 64;
        var _y = y + irandom_range(-70, 70) + 120 + (16 * side);
        
        if (side == 1)
            _y -= 96;
        
        var _xdir = choose(1, -1);
        var _hspd = random_range(3, 6) * _xdir;
        var _vspd = random_range(-9, -14) * 1.16;
        var _grav = random_range(0.8, 1) * 1.2;
        var _inst = instance_create_layer(_x, _y - 40, "FX", obj_universal_fx);
        
        with (_inst)
        {
            anim_sprite = spr_macro_knives_crateshards;
            anim_speed = 0;
            anim_index = _subimg;
            die_outside_view = true;
            vspd = _vspd;
            hspd = _hspd;
            grav = _grav;
            rot_spd = -_inst.hspd;
        }
    }
    
    with (obj_macro_knives_controller)
        event_shake(1);
    
    var _snd = audio_play_sound(snd_crate, 0, 0);
    audio_sound_pitch(_snd, choose(1, 0.96, 1.04));
    instance_destroy();
};
