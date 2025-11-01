testvariablenothing = false;
x += (hspd * global.delta_game_factor);
anim_logic();
timer_logic(0);
timer_logic(1);

if (instance_exists(obj_frenzy) && global.room_last == room && (input_check_pressed("menu_confirm") || input_check_pressed("cancel") || input_check_pressed("action")))
{
    if (obj_frenzy.state_beat > -6)
    {
        if (obj_frenzy.state_beat < 5)
            obj_frenzy.state_beat = 5;
    }
}
