if (my_audiogroup != -4 && !audio_group_is_loaded(my_audiogroup))
{
    alarm[0] = 1;
    exit;
}

event_user(1);
