reset_to_default_all();
op.customMode = false;
op.MAXhp = [210, 260, 190];
op.hp = [op.MAXhp[0], op.MAXhp[1], op.MAXhp[2]];
depth = -100;
file_save();
op.pixelScale = 1;
op.camMode = 0;
audio_stop_all();
res_keys();
ty = 0;
sockXY = [0, 0];
sockMode = [-1, 0, 0];
sockTime = 120;
op.item = [];
trophyAlpha = 1;

undoF = function()
{
    snd(snd_select);
    array_insert(undo, 0, [cur, page]);
    cur = 0;
};

undoDo = function()
{
    snd(snd_menumove);
    cur = undo[0][0];
    page = undo[0][1];
    array_delete(undo, 0, 1);
};

menu = [[[134, 198, [function()
{
    undoF();
    page = 4;
}, function()
{
    undoF();
    page = 1;
}, -1, function()
{
    undoF();
    page = 3;
}, function()
{
    game_end();
}]], ["mid", "arrows2"], g_t("m_1")], [[168, 94, [-1, -1, -1, function()
{
    undoF();
    page = 2;
}, function()
{
    snd(snd_select);
    op.st_simplifyVFX *= -1;
    file_save();
}, function()
{
    snd(snd_select);
    
    if (op.F4toggle)
    {
        op.F4toggle = false;
        
        if (op.F4state == 0)
        {
            window_set_fullscreen(true);
            op.F4state = 1;
        }
        else
        {
            window_set_fullscreen(false);
            op.F4state = 0;
            window_set_size(1280, 960);
            window_center();
        }
    }
}, function()
{
    snd(snd_select);
    op.st_keystrokes *= -1;
    file_save();
}, function()
{
    snd(snd_select);
    op.st_speedrunTimer *= -1;
    file_save();
}, function()
{
    snd(snd_select);
    op.st_noHit *= -1;
    file_save();
}, undoDo]], ["arrows0", "arrows1", "arrows2"], g_t("m_2")], [[168, 94, [-1, -1, -1, -1, -1, -1, -1, function()
{
    snd(snd_select);
    op.keys = [[0, 40], [0, 39], [0, 38], [0, 37], [1, "Z"], [1, "X"], [1, "C"]];
    res_keys();
    file_save();
}, undoDo]], ["controlsKey"], g_t("m_3")], [[42, 184, [function()
{
    undoF();
    page = 5;
}, function()
{
    snd(snd_select);
    
    if (op.musicStyle == 0)
        op.musicStyle = 1;
    else
        op.musicStyle = 0;
    
    file_save();
}, function()
{
    room_goto(rTest);
}, function()
{
    snd(snd_hurt1);
    fileDelete++;
    
    if (fileDelete > 2)
    {
        file_delete("save1");
        game_end();
    }
    else
    {
        fileShake += 10;
        popText("999", 350, 280 - (fileDelete * 20), sPopWhite, 16777215);
    }
}, function()
{
    audio_stop_all();
    
    if (op.challengeMode)
    {
        snd(snd_select);
        op.challengeMode = false;
    }
    else
    {
        op.challengeMode = true;
        snd(snd_explosion);
        snd(snd_lightning);
        audio_play_sound(mus_evilChallenge, -999, true);
        oMenu.lightBright = 1;
    }
    
    file_save();
}, function()
{
    room_goto(rCustomMode);
}, function()
{
    room_goto(rMusicPlayer);
}, undoDo]], ["extras"], g_t("m_4")], [[134, 242, [function()
{
    snd(snd_select);
    room_goto(rView);
    op.gold = 790;
}, function()
{
    op.item = [];
    room_goto(rBattle);
}]], ["mid"], g_t("m_5")], [[42, 200, [function()
{
    if (array_contains(op.save, "win1"))
    {
        snd(snd_txtral);
        
        if (op.itemsON[0] == 0)
            op.itemsON[0] = 1;
        else
            op.itemsON[0] = 0;
    }
    
    file_save();
}, function()
{
    if (array_contains(op.save, "win2"))
    {
        snd(snd_txtSus);
        
        if (op.itemsON[1] == 0)
            op.itemsON[1] = 1;
        else
            op.itemsON[1] = 0;
    }
    
    file_save();
}, undoDo]], ["a"], g_t("m_6")]];
cur = 0;
page = 0;
undo = [];
keysOn = true;
curPos = [66, 276];
controlsKey = -1;
controlsSet = -1;
controls01 = -1;
bcXY = 0;
bcalpha = 0;
bcRGB = 16777215;
libSurf = -1;
libAt = 1;
libCheck = -1;
libXY = [0, 0];
holdZ = 0;
fileShake = 0;
fileDelete = 0;
subtractLight = 0;

if (op.ty < 10 && false)
    room_goto(rTest);

res_i();

repeat (array_length(menu))
{
    array_push(menu[i][1], "cur");
    array_push(menu[i][1], "prop");
    array_push(menu[i][1], "bc2");
    i++;
}

frontC = 0;
credits = 0;
musicSwap = 0;
offOnText = g_t("m_1e");
benAlexCheck = true;
lightBright = 0;
