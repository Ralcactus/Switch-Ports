food[food_count] = global.food[food_count];

if (global.food[food_count] == false)
    audio_play_sound(snd_wrong, 0, 0);
else
    audio_play_sound(snd_munch, 0, 0);

food_count++;

if (food_count < 3)
    alarm[3] = 30;
else
    alarm[4] = 60;
