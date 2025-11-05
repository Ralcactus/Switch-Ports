event_inherited();

if (jumpscare && !game_paused())
{
    if (--jumpscaretimer <= 0)
        instance_destroy();
}
