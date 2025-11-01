event_inherited();
powerup = 1;

event_cash = function()
{
    cash = true;
    audio_play_sound(snd_kaching, 0, 0);
    timer[2] = 21;
    vspd = -12;
    grav = 0.95;
};
