des(oFollow);
op.camMode = 0;
op.musicOW = -1;
op.debug = false;
op.ben = false;
op.parameter = [0, 0, 0, 0];
op.camX = 0;
op.camY = 0;
op.cameX = 0;
op.cameY = 0;
op.drawFollow = true;
oPlayer.freeMove = false;
op.progress = [];
oPlayer.x = 300;
oPlayer.y = 300;

with (oFollow)
{
    x = 300;
    y = 300;
}

oPlayer.move = false;
oPlayer.draw = false;
fix_res();

if (!op.challengeMode)
{
    audio_play_sound(mus_title, -999, true);
    audio_play_sound(mus_trouble_at_hand_old, -999, true);
    audio_sound_gain(mus_title, 1, 0);
    audio_sound_gain(mus_trouble_at_hand_old, 0, 0);
    audio_pause_sound(mus_trouble_at_hand_old);
}
else
{
    audio_play_sound(mus_evilChallenge, -999, true);
}
