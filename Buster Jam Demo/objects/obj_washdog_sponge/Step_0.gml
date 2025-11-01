xAxis = input_check("right") - input_check("left");
yAxis = input_check("down") - input_check("up");
anim_logic();

if (controller.win)
{
    if (audio_is_playing(snd_washdog_wash))
        audio_stop_sound(snd_washdog_wash);
    
    exit;
}

var _lag = 5;

if (xAxis == 0 && yAxis == 0)
{
    spd = easy_smooth(spd, 0, _lag);
    
    if (spd <= 2 && audio_is_playing(snd_washdog_wash))
        audio_stop_sound(snd_washdog_wash);
}
else
{
    spd = easy_smooth(spd, 7, _lag);
    
    if (!audio_is_playing(snd_washdog_wash))
        audio_play_sound_on(controller.audio, snd_washdog_wash, 0, true);
}

if (!place_meeting(x, y, obj_washdog) && audio_is_playing(snd_washdog_wash))
    audio_stop_sound(snd_washdog_wash);

x += (xAxis * spd * global.delta_game_factor);
y += (yAxis * spd * global.delta_game_factor);

if (controller.win)
{
    anim_speed = 1;
    anim_play(spr_br_washdog_sponge_win);
}
