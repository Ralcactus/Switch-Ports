event_inherited();
hitstuntime = max(hitstuntime - 1, 0);

if (!game_paused() && hitstuntime <= 0)
{
    event_user(0);
    
    if (killed)
        instance_destroy();
}
