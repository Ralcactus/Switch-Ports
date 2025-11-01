audio_play_sound(snd_splat, 0, 0);
screen_shake(3, 3);
part_particles_create(global.part_over, hitBy.x, hitBy.y, global.particles.smack, 1);

if (can_die_stomp)
{
    var _stomped = instance_create_layer(x, y, layer, obj_stomped);
    _stomped.anim_sprite = sprite_stomp;
    _stomped.sprite_index = sprite_stomp;
    _stomped.image_xscale = facing;
    _stomped.hitBy = hitBy;
    var _coin = instance_create_layer(x, y - 64 - 40, "Instances_Over", obj_coin);
    audio_play_sound(snd_kaching, 0, 0);
    _coin.kaching = false;
    
    with (_coin)
        event_user(0);
    
    instance_destroy();
}

stomped = true;
event_user(2);
