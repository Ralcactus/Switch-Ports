testvariablenothing = false;
var _inst = instance_place(x, y, obj_macro_knives_bom_launch);

if (_inst)
{
    with (_inst)
        event_user(0);
    
    anim_play(spr_macro_knives_snake_pain);
    var _win = false;
    
    with (obj_macro_knives_controller)
    {
        zoom = 0.85;
        event_shake(1.75, 0.02);
        hits++;
        
        if (hits == 3)
        {
            macro_win = true;
            obj_macro_knives_controller.shake_min = 0.85;
            _win = true;
        }
    }
    
    if (_win)
    {
        draw_bridget = false;
        instance_create_layer(x + arm_xoff + 212, y + arm_yoff + 180, "Bridget", obj_macro_knives_bridget_jump);
    }
    
    if (obj_macro_knives_controller.macro_win)
        timer[1] = explosion_delay;
    else
        timer[0] = 80;
    
    audio_play_sound(snd_ouch, 0, 0);
}

timer_logic(0);
timer_logic(1);
timer_logic(2);
anim_logic();

if (!move_in)
{
    hspd += 0.275;
    get_cams();
    
    if (x > xstart)
        event_done();
}

x += (hspd * global.delta_game_factor);

if (obj_macro_knives_controller.macro_win)
{
    overlay_alpha += 0.006666666666666666;
    
    if (overlay_alpha >= 1.4)
    {
        audio_stop_all();
        audio_play_sound(snd_explosion, 0, 0);
        room_goto(rm_boomtown_boss_macro_win);
    }
}

if (timer[1] != -1)
{
    percent_explosion_delay = approach(percent_explosion_delay, 1, 1/120);
    explosion_delay = use_curve(acurv_linear, percent_explosion_delay, undefined, explosion_delay_start, explosion_delay_end);
}

if (arm_in)
    arm_x = easy_smooth(arm_x, 0, 12);
