susieStuck = true;
susieStuckPoints = 0;
autoAnimatePep = true;
drawUI = true;
damageTimes = 1;
ATKmult = 1;

if (op.challengeMode)
    ATKmult = 1.5;

op.shakeTime = 0;
patternTime = 0;
starMove = [];
loop = false;
ti = 0;
time = 0;
res_keys();
surf = 0;
surf[0] = -1;
surf[1] = -1;
cur = 0;
page = "s";
pep = 0;
stage = 0;
hudY = 0;
pastTP = 0;
res_i();

repeat (10)
{
    hudY[i] = 32;
    pastTP[i] = 0;
    i++;
}

res_i();
undo_tree = 0;
undo_tree[0] = 0;
array_delete(undo_tree, 0, 1);
pepBack = 0;
pepBack[0] = 0;
array_delete(pepBack, 0, 1);
actions = 0;
AAsave = "Skip";
itemDel = 0;
res_i();

repeat (array_length(op.party))
{
    actions[i][0] = 0;
    actions[i][1] = 0;
    actions[i][2] = 0;
    actions[i][3] = 0;
    actions[i][4] = 0;
    actions[i][5] = 0;
    pm_faim[i] = 0;
    pm_names[i] = 0;
    pm_peps[i] = 0;
    pm_act[i] = 0;
    pm_item[i] = 0;
    upP[i] = 0;
    upE[i] = 0;
    op.hp[i] = op.MAXhp[i];
    i++;
}

lines[0] = 1;
lines[1] = 4;
lines[2] = 8;
e_pattern = 0;
e_x = 0;
e_y = 0;
e_xScl = 0;
e_yScl = 0;
comeBack = false;
tot_enemies = 0;
TP = 0;
showTP = 0;
showLine = 0;
TPremove = 0;
eneFlavour = 0;
textExists = false;
pNamesT = false;
eNamesT = false;
move_TP = 50;
move_TP2 = 0;
move_UI = 200;
introON = true;
extraTP = 0;
ralseiAddon = 0;
susieAddon = 0;
snd(snd_weaponpullfast);
playSnd1 = -1;
playSnd2 = -1;
fallenStars = 0;
extraDEF = [0, 0, 0];
soulFloorCap = 325;
soulFloorBounce = 11;
attackCounter = -1;
attack = 0;
attackSave = -1;
battleProgress = [];
fogFadeOn = true;
fogFadeOn2 = true;
alexTimerTrack = irandom_range(40, 45);
alexTimeShow = 0;

if (op.challengeMode)
    alexTimerTrack = op.custom_dtSec;

deathTimerAlpha = 0;
maxText = g_st("maxTP_text");
otherText = g_t("other_text");
