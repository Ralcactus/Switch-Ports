x += hsp;

if ((sign(hsp) == 1 && x > (get_game_width() + sprite_width)) || (sign(hsp) == -1 && x < -sprite_width))
{
    with (obj_credits)
        event_user(0);
    
    instance_destroy();
}
