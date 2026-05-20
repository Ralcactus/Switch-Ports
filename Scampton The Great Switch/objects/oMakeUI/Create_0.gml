Debug = false;
Turns = 0;
EndGame = false;
SBR = 0;
DiceText = 0;
Dice6 = 0;
AnVil = false;
Stat[0] = 0;
Stat[1] = 0;
Stat[2] = 0;
Stat[3] = 0;
Stat[4] = 0;
Stat[5] = 0;
Stat[6] = 0;
Stat[7] = 0;
Stat[8] = 0;
StatWalk = 0;
audio_stop_sound(circus);
audio_stop_sound(M);

with (instance_create_depth(106, 338, depth + 1500, oPep))
{
    Pep = 1;
    ans[0] = sAs_Idle;
    sprite_index = ans[0];
    image_index = 0;
    ans[1] = sAs_Fight;
    ans[2] = 0;
    ans[3] = sAs_Item;
    ans[4] = sAs_Magic2;
    ans[5] = sAs_Defend;
    ans[6] = sAs_Magic1;
    ans[7] = sAs_Magic2;
    ans[8] = sAs_Dead;
    ans[9] = sAs_Hurt;
}

with (instance_create_depth(320, 338, depth + 1500, oPep))
{
    Pep = 2;
    ans[0] = sNo_Idle;
    sprite_index = ans[0];
    image_index = 0;
    ans[1] = sNo_Fight;
    ans[2] = 0;
    ans[3] = sNo_Item;
    ans[4] = sNo_Fight;
    ans[5] = sNo_Defend;
    ans[6] = sNo_Magic1;
    ans[7] = 89;
    ans[8] = sNo_Dead;
    ans[9] = sNo_Hurt;
}

with (instance_create_depth(540, 338, depth + 1500, oPep))
{
    Pep = 3;
    ans[0] = sCh_Idle;
    sprite_index = ans[0];
    image_index = 0;
    ans[1] = sCh_Fight;
    ans[2] = 0;
    ans[3] = sCh_Item;
    ans[4] = sCh_Act;
    ans[5] = sCh_Defend;
    ans[6] = 0;
    ans[7] = 0;
    ans[8] = sCh_Dead;
    ans[9] = sCh_Hurt;
}

_Last = false;
End = 0;
StatusON = false;
G_Fight = 0;
DamUP = 1;
EndSong = true;
LoopGoop = false;
BoxEEF = true;
SMN = true;

if (oP.NoHit == "Disabled" || oP.Deaths < 1)
    sou(35);

if (oP.NoHit == "Enabled" && oP.Deaths > 0)
{
    sou(8);
    sou(32);
}

instance_create_depth(-62, 2, -9999, oTP);

with (oEEF)
{
    if (Seed == "Title")
        instance_destroy();
}

oAlways.PepSlide = false;
oAlways.GameON = true;
Tyme = 0;
ResMemb = false;
Party = 0;
Party[0] = 1;
Party[1] = 2;
Party[2] = 3;
Skills = 0;
Skills[0] = "Check";
Skills[1] = "Chance time";
Skills[2] = "_ir_isPlay";
Skills[3] = "Dice roll";
Skills[4] = "";
Skills[5] = "";
Skills[6] = "_i4Heal Prayer";
Skills[7] = "_i3IceShock";
Skills[8] = "_i4Heal Hailing";
Skills[9] = "";
Skills[10] = "";
Skills[11] = "";
Skills[12] = "_i0Defense Up";
Skills[13] = "";
Skills[14] = "_i1Attack Up";
Skills[15] = "";
Skills[16] = "_i2Immunity";
Skills[17] = "";
HUDx = 0;
HUDy = 150;
HUDy = 0;
PartyCount = 0;
MinusBox = 0;
FlavourMake = 1;
KeyUP = false;
KeyDOWN = false;
KeyLEFT = false;
KeyRIGHT = false;
KeyZ = false;
KeyX = false;
UPtyme = 2;
DOWNtyme = 2;
LEFTtyme = 2;
RIGHTtyme = 2;
Ztyme = 2;
Xtyme = 2;
PartyTurn = 0;
PartyDone = false;
Stage = "MENU";
Cursor = 1;
StickTyme = 34;
PatternStage = 0;
scrFillArray();
MemberMagic[0] = "A_1";
MemberMagic[1] = "N_1";
MemberMagic[2] = "H_1";
MemberHeal[0] = "Heal_1";
MemberHeal[1] = "Heal_1";
MemberHeal[2] = "Heal_1";
MemberItem[0] = 1;
MemberItem[1] = 1;
MemberItem[2] = 1;
MemberItemHeal[0] = "Heal_Item_1";
MemberItemHeal[1] = "Heal_Item_1";
MemberItemHeal[2] = "Heal_Item_1";
MemberTP[0] = 0;
MemberTP[1] = 0;
MemberTP[2] = 0;
SelPep[0] = 0;
SelPep[1] = 0;
SelPep[2] = 0;
MaxHP[0] = 110;
MaxHP[1] = 70;
MaxHP[2] = 90;

if (false || oP.NoHit == "Enabled")
{
    MaxHP[0] = 1;
    MaxHP[1] = 1;
    MaxHP[2] = 1;
}

HP[0] = MaxHP[0];
HP[1] = MaxHP[1];
HP[2] = MaxHP[2];
HP[3] = 9999;
Face[0] = 0;
Face[1] = 8;
Face[2] = 16;
ActMag = 0;
ItemSel = 1;
oSusie.SusieMouth = true;

if (oP.Deaths == 0)
{
    oKris.sprite_index = sKris_Fight;
    oKris.image_index = 0;
    oSusie.sprite_index = sSusie_Fight;
    oSusie.image_index = 0;
    oRalsei.sprite_index = sRalsei_Spin;
    oRalsei.image_index = 0;
}

Items[0] = "NerdSeed";
Items[1] = "AsrielBrew";
Items[2] = "BrutchBrunch";
Items[3] = "NoelleBrew";
Items[4] = "CrystalCob";
Items[5] = "CharkisBrew";
Items[6] = "NerdDrumstick";
Items[7] = "CrystalCob";
Items[8] = "ScrabbledEggs";
Items[9] = "ScrabbledEggs";
Items[10] = "BackGammon";
Items[11] = "ReviveMint";

if (oP.NoHit == "Enabled")
{
    Items = 0;
    Items[0] = "MainMenu";
}

BoxFlav = 1;
Pattern = 0;
TutorialDone = false;
Hatk = false;
RanPat = 0;
RanPat[0] = "no";
array_delete(RanPat, 0, 1);
PatSave = 2;

if (oP.NoHit == "Enabled")
    PatSave = 4;

if (Debug)
{
    Pattern = 0;
    TutorialDone = true;
    Hatk = true;
    PatternStage = 4;
}

Box_X = 0;
Box_Y = 0;
Box_Xscale = 0;
Box_Yscale = 0;
Box_Depth = -3000;
SpamtonMaxHP = 5325;
SpamtonHP = SpamtonMaxHP;
Spare = 0;

if (Debug)
{
    Spare = 99;
    SpamtonHP = 1;
    oTP.TP = 100;
}

Check = 0;
ReturnVal = 0;
SaveDelTP = 0;
DelTP = 0;
TPmemory = 0;
SavePartyTurn = 0;
FaceS = 0;
ScaleHP = 0;
SpareTurns = 0;
HurtMode = 0;
DamageMode = 0;
ExtraParry = 0;
