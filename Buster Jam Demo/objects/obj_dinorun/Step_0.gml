if (!controller.win)
    exit;

if (place_meeting(x, y, obj_dinorun_cactus) && !controller.ended)
{
    audio_play_sound_on(controller.audio, snd_dinorun_funeral, 0, 0);
    controller.microgame_hspd = 0;
    controller.win = false;
    
    if (audio_is_playing(snd_dinorun_jump))
        audio_stop_sound(snd_dinorun_jump);
    
    var _inst = instance_create_layer(0, 0, "Over1", obj_dinorun_funeral);
    _inst.ID = ID;
    _inst.controller = controller;
    scr_micro_stop_music();
    exit;
}

if ((vspd > 0 && y >= (ystart - vspd)) || y >= ystart)
{
    y = ystart;
    vspd = 0;
    
    if (input_check_pressed("jump") || input_check_pressed("up"))
        vspd = -jump_strength;
}
else
{
    vspd += (grav * global.delta_game_factor * mult);
}

y += (vspd * global.delta_game_factor * mult);
anim_logic();
