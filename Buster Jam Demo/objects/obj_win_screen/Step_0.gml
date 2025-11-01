testvariablenothing = false;
timer_logic(6);

if (!ready)
    exit;

timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);
timer_logic(5);
time += (0.015 * global.delta_game_factor);

if (finished)
    glyph_alpha = approach(glyph_alpha, 1, 1/15);

if (finished && !done && input_check_pressed("menu_confirm"))
{
    room_goto_fade(global.frenzy_nextroom, 90);
    
    if (!boss)
        audio_fadeout_stop(global.bgm_play, 0, 1000);
    
    done = true;
}
