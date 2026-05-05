time_til_timed = round(time_in_frames(0, 9.45));
timer = time_in_frames(0, 30);
youre_deat_meat = 60;
bg_flash = 0;
target_fill = timer;
t = 0;


depth = -100;
minutes = 0;
seconds = 15;
addseconds = seconds;
saved_seconds = seconds;
alarm[0] = 60;
timer_y = 540 + sprite_get_height(spr_timer);
timer_index = 0;
image_alpha = 0
image_speed = 0.15

function concat()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    return _string;
}