audio_play_sound(snd_belltree, 0, false);
completed = true;

with (obj_map_fuseblock)
{
    event_poof();
    instance_destroy();
}

event_completed();
