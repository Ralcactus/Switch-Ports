testvariablenothing = false;
timer[0] = 60;

timer_func[0] = function()
{
    global.save_data.save_block = room_get_name(room);
    scr_save_game();
    audio_play_sound(snd_belltree, 0, 0);
    
    if (audio_is_playing(sfx_saving))
        audio_stop_sound(sfx_saving);
    
    save_text = "SAVED!";
    save_text_flash = 1.5;
    timer[1] = 30;
};

timer[1] = -1;

timer_func[1] = function()
{
    saved = true;
};

save_out = 1;
saved = false;
save_out_hspd = 0;
save_text = "SAVING...";
save_text_flash = 0;
timer[2] = 10;

timer_func[2] = function()
{
};

sfx_saving = -4;
