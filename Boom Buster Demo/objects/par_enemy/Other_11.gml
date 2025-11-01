play_impact();
screen_shake(8, 8);

if (hitBy.x >= x)
    _dir = -1;
else
    _dir = 1;

var _y = y - ((bbox_bottom - bbox_top) / 2);
part_particles_create(global.part_over, hitBy.x + (30 * _dir), _y, global.particles.hitmarker, 1);

if (can_die_spin)
{
    var _coin = instance_create_layer(x - 32, y - 64 - 40, "Instances_Over", obj_coin);
    
    with (_coin)
    {
        kaching = false;
        event_user(0);
    }
    
    audio_play_sound(snd_kaching, 0, 0);
    var _spun = instance_create_layer(x, y, layer, obj_spun);
    _spun.anim_sprite = sprite_spun;
    _spun.facing = -facing;
    _spun.hspd = _dir;
    instance_destroy();
}

spun = true;
event_user(2);
