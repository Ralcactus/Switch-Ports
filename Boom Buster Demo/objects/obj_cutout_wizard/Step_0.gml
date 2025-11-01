physics_apply();
var _player = instance_place(x, y, obj_player);

if (_player && (_player.coyote_spin || _player.coyote_slide || global.nuclear))
{
    for (var i = 0; i < array_length(shard_x); i++)
    {
        var _x = (x - (image_xscale * sprite_xoffset)) + sprite_get_xoffset(spr_cutout_wizard_shards) + shard_x[i];
        var _y = (y - sprite_yoffset) + sprite_get_yoffset(spr_cutout_wizard_shards) + shard_y[i];
        var _fx = instance_create_layer(_x, _y, layer, obj_fx);
        _fx.destroy = 2;
        _fx.anim_sprite = spr_cutout_wizard_shards;
        _fx.anim_index = i;
        _fx.rotate_spd = choose(-4, 4);
        _fx.anim_speed = 0;
        _fx.vspd = -12;
        _fx.grav = 0.8;
        _fx.image_xscale = image_xscale;
        
        if (shard_x[i] >= 80)
            _fx.hspd = 2;
        else
            _fx.hspd = -2;
    }
    
    var _snd = audio_play_sound(snd_break, 0, 0);
    audio_sound_gain(_snd, 0.5, 0);
    var _dir;
    
    if (_player.x > x)
        _dir = -1;
    else
        _dir = 1;
    
    hitBy = _player;
    part_particles_create(global.part_over, hitBy.x + (_dir * 30), hitBy.y - 44, global.particles.hitmarker, 1);
    screen_shake(10, 10);
    instance_destroy();
    event_break();
}
