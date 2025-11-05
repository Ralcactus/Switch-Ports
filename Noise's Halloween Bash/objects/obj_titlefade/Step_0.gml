fade = approach(fade, fadein, 0.1);

if (fade >= 1 && fadein)
{
    obj_player.state = states.normal;
    player_reset();
    room_goto(obj_player.firstroom);
    fadein = false;
}

if (fade <= 0 && !fadein)
    instance_destroy();
