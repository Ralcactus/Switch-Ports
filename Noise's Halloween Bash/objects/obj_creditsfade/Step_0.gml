if (game_paused())
    exit;

alpha = approach(alpha, !roomchanged * 2, 0.01);

if (alpha >= 2 && !roomchanged)
{
    room_goto(Credits);
    alpha = 1;
    obj_player.targetdoor = 0;
    roomchanged = true;
}

if (alpha <= 0 && roomchanged)
    instance_destroy();
