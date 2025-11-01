var _x = 512;
var _y;

if (state == state_crouch)
    _y = 280;
else
    _y = 172;

var _inst = instance_create_micro(_x, _y, "Over", obj_micro_apedino_fireball);

if (state == state_crouch)
    _inst.down = true;

audio_play_sound_on(controller.audio, snd_micro_apedino_fireball, false, 0);
