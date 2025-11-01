var _grounded = on_ground_micro();

if (controller.win || controller.ended)
    deac = true;

if (deac)
    xAxis = 0;
else
    xAxis = input_check("right", player) - input_check("left", player);

hspd = approach(hspd, runspd * xAxis, acc);

if (input_check_pressed("jump", player) && _grounded && !deac)
{
    vspd = jump_strength;
    audio_play_sound_on(controller.audio, snd_micro_sketchcollect_jump, false, 0);
}

physics_apply_2d_micro();

if (controller.win)
{
    anim_play(spr_sketchcollect_buster_win);
}
else if (_grounded)
{
    if (xAxis == 0 && hspd == 0)
        anim_play(spr_sketchcollect_buster_idle);
    else
        anim_play(spr_sketchcollect_buster_walk);
    
    if (xAxis != 0)
        facing = xAxis;
}
else
{
    anim_play(spr_sketchcollect_buster_jump);
}

anim_logic();
