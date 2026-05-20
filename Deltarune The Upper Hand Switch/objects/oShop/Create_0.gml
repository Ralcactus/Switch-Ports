oPlayer.move = false;
oPlayer.draw = false;
shopText = g_t("shop_text");
res_keys();
run = -1;
time = 0;
page = 0;
cur = 0;
curSave = -1;
costs = [100, 200, 300, 70];
faceImage = 0;
faceImage2 = 0;
faceTime = 40;
targetX = 0;
targetY = 0;
isX = 0;
isY = 0;
targetSpeed = 0;
handImage = 2;
handImage2 = 0;
targetXhand = 0;
targetYhand = 0;
isXhand = 0;
isYhand = 0;
handTalk = false;
handShake = false;
handShakeX = 0;
sockLock = false;
_ex = 0;
_eys = 0;
pupStart = -1;
bcON = false;
bcAlpha = 0;
curtainX = 0;
curtainShake = 0;
curtainC = -1;
curtainTarget = 0;

curtain = function(arg0)
{
    oShop.curtainC = 0;
    oShop.curtainTarget = arg0;
};

black = 0;
pupSheck = -1;
shopAlpha = 1;
textMainTrig = false;
textTalkTrig = false;
do_text([34], [266], g_t("9_4"), ["mono", "bc", "keysOff", "shopSide1"], [sFontSock], undefined, [snd_txtMonster]);
talkProgress = [[0, 0], [0, 0], [0, 0], [1, 0]];
soldOut = [[0, 0], [0, 0], [0, 0], [1, 0], [0, 0]];

if (array_contains(op.progress, "ticket"))
    soldOut[3] = [1, 1];

if (array_contains(op.progress, "talkP1"))
    talkProgress[3] = [1, 1];
