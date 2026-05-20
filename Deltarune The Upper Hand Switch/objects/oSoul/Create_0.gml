if (room == rBattle)
    des(oGround);

instance_destroy(oGraze);
instance_create_depth(x, y, -9999, oGraze);
image_index = 0;
an = true;
_end = false;
an_ty = 0;
sX = x;
sY = y;

if (room != rSoulTutorial)
{
    goX = oBox.x;
    goY = oBox.y;
}

pastX = x;
pastY = y;
res_keys();
walk = 3;
iframes_max = 35;
invis = 0;

if (op.alexMode)
    iframes_max = 15;

iframes = 0;
grazeAlpha = 0;
color = 16777215;
iframesAn = 0;
array = 0;
a_i = 0;
lastHit = -1;
left = 0;
damage = 0;
mode = "r";
spin = [0, 0];
size = 1;
grav = 0;
jj = false;
time = 10;
timeR = 0;
jumps = 2;
jumpsR = 1;
ct = 6;
ctR = 0;
apex = 3;
apexR = 0;
smash = false;
flash = 0;
wow = false;
grabId = -1;
grabIdTime = 0;
move = true;
groundMult = 1;
drawL = 1;
soulRoof = 10;

if (room != rSoulTutorial)
{
    if (oBUI.attack == "final")
        soulRoof = -99999;
}

if (room == rSoulTutorial)
{
    move = false;
    walk = 4;
    an = false;
    grav = -15;
    mode = "b";
    depth = -9999;
    spawnEEF(x, y, sSoul, 2, "grow1,drawN");
    spawnEEF(x, y, sSoul, 1, "grow2,drawN");
    snd(snd_soulmode);
}
