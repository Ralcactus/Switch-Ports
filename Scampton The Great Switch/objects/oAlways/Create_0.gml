TTT = 0;
pHP = 0;
zeroC = 0;
ESC = 10;
audio_sound_pitch(snd_txtspam, 0.7);
audio_sound_pitch(snd_mercyadd, 1.25);
audio_sound_pitch(snd_Sneezing, 1.25);
CamDelay = 10;
CamWait = 200;
DevDam = 1;
BattleMusicPitch = 1;

if (oP.MusicP == 0)
{
    BattleMusic = BIG;
    
    if ((oP.Win_P && oP.Win_G && iRan(1, 100) == 1) || keyboard_check(ord("1")))
        BattleMusic = Bigger_bang_fin;
    
    if (oP.PistonMode)
        BattleMusic = spamton_song_3;
    
    oP.MusicP = BattleMusic;
}
else
{
    BattleMusic = oP.MusicP;
}

Tyme = 0;
TymeRail = 0;
TymeGlow = 0;
BCspeed = 1;
SoulSpez = false;
GoldenPipisPoints = 0;
Marselo = 0;
Mesg = 0;
MM_Cursor = "MM_1";
LastNumb = 3;
curNumbYes = false;
StackNumber = 0;
AwayNumber = 0;
view_x = camera_get_view_x(view_camera[0]);
CameraX = 0;
view_y = camera_get_view_y(view_camera[0]);
CameraY = 0;
TarCamX = CameraX;
TarCamY = CameraY;
ShakeTyme = 0;
ShakePower = 0;
KeyUP = false;
KeyDOWN = false;
KeyLEFT = false;
KeyRIGHT = false;
KeyZ = false;
KeyX = false;
KeyC = false;
UPtyme = 2;
DOWNtyme = 2;
LEFTtyme = 2;
RIGHTtyme = 2;
Ztyme = 2;
Xtyme = 2;
Ctyme = 2;
GameON = false;
StopCCtyme = false;
PepSlide = false;
ActionWait = 0;
Damage = false;
DamageMode = "Normal";
PastPep = "no";
Pep = "no";
MultiShot = 0;
PointyGuard = 0;
Chield = 0;
BlackB2 = 0;
DA = 0;
DA[0] = 18;
DA[1] = 23;
DA[2] = 21;
DA[3] = 12;
DA[4] = 16;
DA[5] = 14;
i1 = 0;
