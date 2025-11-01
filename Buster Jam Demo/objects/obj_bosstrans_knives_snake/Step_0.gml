testvariablenothing = false;
buster_ind += ((sprite_get_speed(buster_spr) / 60) * global.delta_game_factor);

if (buster_ind >= sprite_get_number(buster_spr))
    event_animend_buster();

snake_ind += ((sprite_get_speed(snake_spr) / 60) * global.delta_game_factor);

if (snake_ind >= sprite_get_number(snake_spr))
    event_animend_snake();

shake = approach(shake, 0, 0.041666666666666664);
zoom = easy_smooth(zoom, 1, 3);

if (snake_in)
    snake_yoff = easy_smooth(snake_yoff, 0, 5);
else
    snake_yoff = easy_smooth(snake_yoff, 450, 2);

timer_logic(0);
timer_logic(1);
timer_logic(2);
