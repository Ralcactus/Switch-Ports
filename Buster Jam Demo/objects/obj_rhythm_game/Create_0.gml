beat_scale = 1;
global.spd = 0.75;
x = 960;
y = 200;
width = 60;
height = 60;
hp = 5;
score = 0;
score_data[0] = [50, "OK"];
score_data[1] = [100, "Good"];
score_data[2] = [200, "Perfect!"];
last_score = "";

event_hurt = function()
{
    hp--;
    audio_stop_play(snd_ouch, 0, 0);
};
