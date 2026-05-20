image_speed = 0;
res_keys();
walkSpeed = 3;
pastX = x;
pastY = y;
sprite = sKris_Down;
ss = 0;
move = false;
moveTy = 0;
draw = true;
freeMove = false;
doLerp = false;
dontSetSprites = false;
pastXYS = [];

repeat (72)
    array_insert(pastXYS, 0, [x, y, sKris_Down, 0]);

moveTime = [0, 0, 0, 0, x, y, 0, 0];
seed = [];
ey = 0;
shake = 0;
shakeX = 0;
sinceMoved = 0;
runTimer = 0;
walkMult = 0;
freeAn = false;
dodgeAlpha = 0;
dodge_applyShaders = true;
dodgeSoul = false;
dodgeFrames = 0;
