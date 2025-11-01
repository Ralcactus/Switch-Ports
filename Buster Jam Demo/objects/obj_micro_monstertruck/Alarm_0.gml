if (instance_exists(obj_microscanner_setup))
    exit;

with (controller)
{
    event_set_time(16);
    win = true;
}

instance_create_micro(x, y, "Behind1", obj_micro_monstertruck_bg);
my_drive_snd = audio_play_sound_on(controller.audio, snd_micro_monstertruck_drive, true, 0);
