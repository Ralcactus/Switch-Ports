loaded = true;

for (var i = 0; i < array_length(audio_groups); i++)
{
    if (!audio_group_is_loaded(audio_groups[i]))
    {
        loaded = false;
        alarm[0] = 1;
        break;
    }
}
