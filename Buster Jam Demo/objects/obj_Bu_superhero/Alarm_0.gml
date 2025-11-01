for (var i = 0; i < 4; i++)
{
    var _inst = instance_create_layer(-280 - (1200 * i), irandom_range(180, controller.game_height - 180), "Instances", obj_Bu_superhero_planet);
    _inst.sprite_index = sprite[i];
    _inst.ID = ID;
    _inst.controller = controller;
}

controller.win = true;
wind_snd = audio_play_sound_on(controller.audio, snd_Bu_superhero_wind, true, 0);

if (instance_exists(obj_boss_tutorial))
{
    with (controller)
        event_set_time(9);
}

controller.microgame_hspd = 15;
