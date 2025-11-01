event_inherited();

if (powerup != -4)
{
    if (global.powerup != powerup)
    {
        with (obj_player)
        {
            newPowerup = other.powerup;
            event_user(1);
        }
        
        audio_play_sound(snd_powerup, 0, 0);
        audio_queue(voice_buster_laugh, 52, true, true);
        instance_destroy();
    }
    else
    {
        event_cash();
    }
}

var _fx = instance_create_layer(myPlayer.x, myPlayer.y, "Particles_Over", obj_fx_hp);
_fx.follow = myPlayer.id;
ds_list_add(global.list_ignorefreeze, _fx);
