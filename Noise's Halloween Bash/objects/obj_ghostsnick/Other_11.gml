if (game_paused())
    exit;

if (!jumpscare)
{
    fmod_studio_event_instance_start(jumpscaresnd);
    jumpscare = true;
    jumpscaretimer = 60;
    save_easteregg("itsHim");
}
