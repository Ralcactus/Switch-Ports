op.camMode = "player";
op.parameter = [0, 0, 0, 0];
audio_stop_all();
oPlayer.move = false;
oPlayer.draw = false;
oPlayer.x = 0;
oPlayer.y = 0;
snd(snd_wing);
res_i();

funcDrawGUI = function()
{
    i += ((314 - i) / 5);
    ext(sPlayBC, 1, 380 - round(i), 0, -2);
    ext(sPlayBC, 1, 260 + round(i), 0, 2);
    ext(sPixel, 0, 0, 0, -1000, 1000, undefined, 0);
    ext(sPixel, 0, 640, 0, 1000, 1000, undefined, 0);
    ext(sPixel, 0, 0, 338, 1000, 1000, undefined, 0, i / 314);
};
