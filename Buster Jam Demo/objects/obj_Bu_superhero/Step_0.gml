if (controller.win)
{
    xAxis = 0;
    yAxis = input_check("down", player) - input_check("up", player);
}
else
{
    xAxis = 0;
    yAxis = 0;
}

hspd = easy_smooth(hspd, xAxis * flyspd, 2.5);
vspd = easy_smooth(vspd, yAxis * flyspd, 2.5);
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);

if (y < 0)
    y = 0;

if ((y + 199) > controller.game_height)
    y = controller.game_height - 199;

if (place_meeting_micro(x, y, obj_Bu_superhero_planet) && controller.win && !controller.ended)
{
    var _array = instance_place_array(x, y, obj_Bu_superhero_planet);
    
    for (var i = 0; i < array_length(_array); i++)
    {
        var _inst = _array[i];
        
        if (!_inst.ID == ID)
            continue;
        
        with (_inst)
            event_user(0);
    }
    
    controller.win = false;
    
    if (audio_is_playing(wind_snd))
        audio_stop_sound(wind_snd);
    
    audio_play_sound_on(controller.audio, snd_Bu_superhero_bonebreak, 0, 0);
    anim_play(spr_Bu_superhero_fail);
    controller.microgame_hspd = 0;
}

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;
