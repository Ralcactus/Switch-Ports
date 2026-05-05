if (room == rank_room)
{
    visible = false;
    instance_destroy();
}
else
{
    visible = true;
}

timer_y = approach(timer_y, 540, 2);

if (floor(timer_index) > (sprite_get_number(spr_timer) - 1))
    timer_index = frac(timer_index);

if (seconds != addseconds){
	seconds = approach(seconds, addseconds, 0.3);
	
    if (seconds <= 0 && minutes > 0) {
        seconds += 60;
        minutes--;
    }
}
else{
	saved_seconds = seconds;	
	
    if (alarm_get(0) == -1)
        alarm[0] = 60;
}

if (seconds >= 60){
	minutes++;
	seconds = 0;	
}