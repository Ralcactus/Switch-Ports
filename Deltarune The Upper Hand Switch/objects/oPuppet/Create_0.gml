image_xscale = 2;
image_yscale = 2;
res_i();
res_j();
res_k();
ty = 0;
tyA = 0;
numb = 0;
atribute = [];
func = -1;
run = -1;
speed_ = 0;
targetX = x;
targetY = y;
targetTrue = false;
pastX = x;
pastY = y;
path = -1;
glide = false;
pathStart = false;
eX = 0;
eY = 0;
eAngle = 0;
shakeXY = [0, 0];
shake = 0;
color = [255, 255, 255];
colorIS = [255, 255, 255];
slick = 1;
wob = 0;
imageFlip = [0, 0, 0];
scaleFlip = [0, 0];
sound = -1;
sound2 = -1;
armStuck = true;
tornadoGrabTy = [0, 0, 0];
tornadoGrabMoreSpeed = 0;
tornadoGrabTime = 50;
tornadoGrabRot = 0;
tornadoGrabRotMod = 0;

if (room == rPuppetshow2)
{
    while (tornadoGrabRotMod > -0.5 && tornadoGrabRotMod < 0.5)
        tornadoGrabRotMod = irandom_range(-10, 10) / 10;
}

function tornadoPos(arg0 = 0)
{
    x += (((320 + (dcos((op.ty * 5) + (90 * arg0)) * 220)) - x) / tornadoGrabTime);
    y += (((190 + (dsin((op.ty * 5) + (90 * arg0)) * 70)) - y) / tornadoGrabTime);
}
