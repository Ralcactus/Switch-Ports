if (ESC != 0)
    ESC--;

if (ESC == 0 && keyboard_check_pressed(vk_escape) && room != rMainu && room != rGameOver)
{
    oP.TargetZoom = 1;
    TarCamX = 0;
    TarCamY = 0;
    audio_stop_all();
    room_goto(rMainu);
    
    with (oEEF)
    {
        if (Seed == "BattleToFade")
        {
            persistent = false;
            des(0);
        }
    }
}

if (keyboard_check_pressed(ord("0")) && room == rMainu)
{
    zeroC++;
    
    if (zeroC == 3)
    {
        deleteSave();
        game_end();
    }
}

if (AwayNumber != 0)
    AwayNumber -= 1;

Tyme += 1;
TymeGlow += 1;

if ((round(Tyme / 2) * 2) == Tyme)
    TymeRail += BCspeed;

layer_x("BC_5", TymeRail * -5);
layer_x("BC_4", TymeRail * -4);
layer_x("BC_2", TymeRail * -5);
layer_x("BC_3", TymeRail * -6);
layer_x("BC_Rail", TymeRail * -15);

if (room != rGameOver)
{
    if (CamWait == 0)
    {
        CameraX += ((TarCamX - CameraX) / CamDelay);
        CameraY += ((TarCamY - CameraY) / CamDelay);
    }
    else
    {
        CamWait -= 1;
    }
}
else
{
    CamWait = 20;
}

if (ShakeTyme > 0)
{
    ShakeTyme -= 1;
    camera_set_view_pos(view_camera[0], CameraX + view_x + irandom_range(-ShakePower, ShakePower), CameraY + view_y + irandom_range(-ShakePower, ShakePower));
}
else
{
    ShakePower = 0;
    camera_set_view_pos(view_camera[0], CameraX + view_x, CameraY + view_y);
}

KeyUP = keyboard_check(vk_up);

if (keyboard_check(ord("W")))
    KeyUP = true;

KeyDOWN = keyboard_check(vk_down);

if (keyboard_check(ord("S")))
    KeyDOWN = true;

KeyLEFT = keyboard_check(vk_left);

if (keyboard_check(ord("A")))
    KeyLEFT = true;

KeyRIGHT = keyboard_check(vk_right);

if (keyboard_check(ord("D")))
    KeyRIGHT = true;

KeyZ = keyboard_check(ord("Z"));

if (keyboard_check(vk_enter))
    KeyZ = true;

KeyX = keyboard_check(ord("X"));

if (keyboard_check(vk_shift))
    KeyX = true;

KeyC = keyboard_check(ord("C"));

if (oP.MM_KeyTyme > 0)
    KeyZ = false;

if (KeyUP)
    UPtyme += 1;
else
    UPtyme = 0;

if (KeyDOWN)
    DOWNtyme += 1;
else
    DOWNtyme = 0;

if (KeyLEFT)
    LEFTtyme += 1;
else
    LEFTtyme = 0;

if (KeyRIGHT)
    RIGHTtyme += 1;
else
    RIGHTtyme = 0;

if (KeyZ)
    Ztyme += 1;
else
    Ztyme = 0;

if (KeyX)
    Xtyme += 1;
else
    Xtyme = 0;

if (KeyC)
    Ctyme += 1;
else
    Ctyme = 0;

if (ActionWait != 0)
{
    ActionWait -= 1;
    KeyZ = false;
    KeyX = false;
    KeyC = false;
}

if (oP.Win_P || oP.Win_G)
{
    scrMMcursor("s_MM1", "s_MM4", "s_MM2", 0, 0);
    scrMMcursor("s_MM2", "s_MM1", "s_MM3", 0, 0);
    scrMMcursor("s_MM3", "s_MM2", "s_MM_I1", 0, 0);
    scrMMcursor("s_MM_I1", "s_MM3", "s_MM4", 0, 0);
    scrMMcursor("s_MM4", "s_MM_I1", "s_MM1", 0, 0);
}
else
{
    scrMMcursor("s_MM1", "s_MM4", "s_MM2", 0, 0);
    scrMMcursor("s_MM2", "s_MM1", "s_MM3", 0, 0);
    scrMMcursor("s_MM3", "s_MM2", "s_MM4", 0, 0);
    scrMMcursor("s_MM4", "s_MM3", "s_MM1", 0, 0);
}

scrMMcursor("s_MM5", "s_MM7", "s_MM6", 0, 0);
scrMMcursor("s_MM6", "s_MM5", "s_MML", 0, 0);
scrMMcursor("s_MML", "s_MM6", "s_MM7", 0, 0);
scrMMcursor("s_MM7", "s_MML", "s_MM5", 0, 0);
scrMMcursor("s_MM_I2", "s_MM_I4", "s_MM_I3", 0, 0);
scrMMcursor("s_MM_I3", "s_MM_I2", "s_MM_I4", 0, 0);
scrMMcursor("s_MM_I4", "s_MM_I3", "s_MM_I2", 0, 0);
scrMMcursor("scaI_0", 0, 0, "scaI_1", "scaI_2");
scrMMcursor("scaI_1", 0, 0, 0, "scaI_2");
scrMMcursor("scaI_2", 0, 0, "scaI_1", 0);

if (MM_Cursor == "scaI_1" && KeyZ && Ztyme == 1)
{
    instance_destroy(oTextEngine);
    Ztyme = 2;
    MM_Cursor = "jaja_1";
    oAlways.Mesg = "Sca_2w";
    
    with (instance_create_depth(100, 100, -9999, oTextEngine))
    {
        JustText = true;
        Seed = "(TB)@Voicer";
        Spez = "HeadBJE";
        EndMesg = "Sca_3";
        Text[0] = "* EAHAHAHAHAHAHAHAHA!!!€€€€€€€€€£* FINALLY!!!!";
        _Voice[0] = 34;
    }
}

if (MM_Cursor == "scaI_2" && KeyZ && Ztyme == 1)
{
    instance_destroy(oTextEngine);
    Ztyme = 2;
    MM_Cursor = "jaja_2";
    oAlways.Mesg = "Sca_2w";
    
    with (instance_create_depth(100, 100, -9999, oTextEngine))
    {
        JustText = true;
        Seed = "(TB)@Voicer";
        Spez = "HeadBJE";
        EndMesg = "Sca_4";
        Text[0] = "* HOHO YOU SILLY GOOSE!";
        _Voice[0] = 34;
        Text[1] = "* We both know that's not@what you'll do.";
        _Voice[1] = 34;
    }
}

if (MM_Cursor == "start_S")
{
    Marselo++;
    
    if (Marselo == 200)
        room_goto(rIntro);
}

if (MM_Cursor == "start_C")
{
    Marselo++;
    
    if (Marselo == 100)
        room_goto(rCredits);
}

if (MM_Cursor == "start_L")
{
    Marselo++;
    
    if (Marselo == 100)
        room_goto(rLibrary);
}

if ((KeyX && Xtyme == 1) && (MM_Cursor == "s_MM5" || MM_Cursor == "s_MM6" || MM_Cursor == "s_MML"))
{
    Xtyme = 2;
    MM_Cursor = "s_MM7";
    sou(39);
}

if ((KeyX && Xtyme == 1) && (MM_Cursor == "s_MM_I2" || MM_Cursor == "s_MM_I3"))
{
    Xtyme = 2;
    MM_Cursor = "s_MM_I4";
    sou(39);
}

if (((KeyX && Xtyme == 1) || (KeyZ && Ztyme == 1)) && MM_Cursor == "s_MM7")
{
    Xtyme = 2;
    Ztyme = 2;
    MM_Cursor = "s_MM2";
    sou(39);
    
    with (oCC2)
    {
        if (StringContains(Seed, "MenuPris"))
            i1 = 1;
    }
}

if (((KeyX && Xtyme == 1) || (KeyZ && Ztyme == 1)) && MM_Cursor == "s_MM_I4")
{
    Xtyme = 2;
    Ztyme = 2;
    MM_Cursor = "s_MM_I1";
    sou(39);
    
    with (oCC2)
    {
        if (StringContains(Seed, "MenuPris"))
            i1 = 1;
    }
}

if (MM_Cursor == "s_MM1" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    sou(101);
    MM_Cursor = "start_S";
}

if (MM_Cursor == "s_MM3" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    sou(101);
    MM_Cursor = "start_C";
}

if (MM_Cursor == "s_MML" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    sou(101);
    MM_Cursor = "start_L";
}

if (MM_Cursor == "s_MM2" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    sou(101);
    MM_Cursor = "s_MM5";
    
    with (oCC2)
    {
        if (StringContains(Seed, "MenuPris"))
            i1 = 2;
    }
}

if (MM_Cursor == "s_MM_I1" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    sou(101);
    
    if (oP.Win_P)
        MM_Cursor = "s_MM_I2";
    else
        MM_Cursor = "s_MM_I3";
    
    with (oCC2)
    {
        if (StringContains(Seed, "MenuPris"))
            i1 = 3;
    }
}

if (MM_Cursor == "s_MM_I2" && KeyZ && Ztyme == 1 && oP.Win_P)
{
    Ztyme = 2;
    sou(98);
    
    if (oP.setP)
        oP.setP = false;
    else
        oP.setP = true;
    
    saveGame();
}

if (MM_Cursor == "s_MM_I3" && KeyZ && Ztyme == 1 && oP.Win_G)
{
    Ztyme = 2;
    sou(101);
    
    if (oP.setG)
        oP.setG = false;
    else
        oP.setG = true;
    
    saveGame();
}

if (MM_Cursor == "s_MM4" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    game_end();
}

if (MM_Cursor == "s_MM5" && KeyZ && Ztyme == 1)
{
    Ztyme = 2;
    instance_create_depth(0, 0, 0, oStartBattle1);
}

if (MM_Cursor == "s_MM5" || MM_Cursor == "s_MM6" || MM_Cursor == "s_MM7")
{
    with (oTextEngine)
    {
        if (Spez2 == "ID")
            instance_destroy();
    }
    
    with (instance_create_depth(200, 67, -9999, oTextEngine))
    {
        StringAT = 999;
        Mono = true;
        BC = true;
        Spez = "O_MM";
        Spez2 = "ID";
        Spez3 = "BlackBC";
        Font = 42;
        image_xscale = 1;
        image_yscale = 1;
        Text[0] = "(" + oP.NoHit + ")";
        
        if (oP.NoHit == "Enabled")
            StartX = 204;
    }
}

scrMMcursor("GO_1", 0, "GO_2", 0, 0);
scrMMcursor("GO_2", "GO_1", 0, 0, 0);

if (MM_Cursor == "GO_1" && KeyZ && Ztyme == 1)
{
    sou(42);
    Ztyme = 2;
    MM_Cursor = "NOT";
    
    with (instance_create_depth(0, 0, 0, oGO_go))
        Seed = 1;
}

if (MM_Cursor == "GO_2" && KeyZ && Ztyme == 1)
{
    sou(42);
    Ztyme = 2;
    MM_Cursor = "NOT";
    
    with (instance_create_depth(0, 0, 0, oGO_go))
        Seed = 2;
    
    oP.Deaths = 0;
    audio_stop_sound(oAlways.BattleMusic);
}

scrMMcursor("MM_1", "MM_3", "MM_2", 0, 0);
scrMMcursor("MM_2", "MM_1", "MM_3", 0, 0);
scrMMcursor("MM_3", "MM_2", "MM_1", 0, 0);
scrMMcursor("MM_O_BACK", LastNumb, 1, 0, 0);
curNumbYes = false;

if (MM_Cursor == 1 || MM_Cursor == 2 || MM_Cursor == 3)
{
    curNumbYes = true;
    
    if (KeyX && Xtyme == 1 && MM_Cursor != "MM_O_BACK")
    {
        sou(39);
        Xtyme = 2;
        MM_Cursor = "MM_O_BACK";
        sctBumpText("MM_O_BACK", 1);
    }
    
    if (KeyUP && UPtyme == 1 && MM_Cursor != "MM_O_BACK")
    {
        sou(39);
        UPtyme = 1;
        MM_Cursor -= 1;
        
        if (MM_Cursor == 0)
            MM_Cursor = "MM_O_BACK";
        
        sctBumpText(MM_Cursor, 1);
    }
    
    if (KeyDOWN && DOWNtyme == 1 && MM_Cursor != "MM_O_BACK")
    {
        sou(39);
        DOWNtyme = 1;
        MM_Cursor += 1;
        
        if (MM_Cursor == (LastNumb + 1))
            MM_Cursor = "MM_O_BACK";
        
        sctBumpText(MM_Cursor, 2);
    }
}

if (curNumbYes || MM_Cursor == "MM_O_BACK")
{
    with (oTextEngine)
    {
        if (Spez2 == "ID")
            instance_destroy();
    }
    
    with (instance_create_depth(170, 104, -9999, oTextEngine))
    {
        StringAT = 999;
        Mono = true;
        BC = false;
        Spez = "O_MM";
        Spez2 = "ID";
        Font = 42;
        image_xscale = 1;
        image_yscale = 1;
        Text[0] = "(" + oP.NoHit + ")";
        
        if (oP.NoHit == "Enabled")
            StartX = 174;
    }
}

if (((KeyX && Xtyme == 1) || (KeyZ && Ztyme == 1)) && MM_Cursor == "MM_O_BACK")
{
    if (KeyX && Xtyme == 1)
        sou(39);
    else
        sou(101);
    
    MM_Cursor = "MM_2";
    Xtyme = 2;
    Ztyme = 2;
    sctBumpText("MM_2", 2);
    instance_destroy(oCC);
    
    with (oTextEngine)
    {
        if (Spez == "O_MM")
            instance_destroy();
    }
}

if (MM_Cursor == "MM_1" && KeyZ && Ztyme == 1)
{
    audio_stop_sound(Hoagy_Time);
    MM_Cursor = 0;
    Ztyme = 2;
    instance_destroy(oTextEngine);
    
    with (instance_create_depth(0, 0, 0, oCC))
        Seed = "1st";
    
    with (oCC)
    {
        if (Spez == "Del_CC_Start_MM")
            instance_destroy();
    }
    
    with (oEEF)
    {
        if (Seed == "Title")
            instance_destroy();
    }
}

if (MM_Cursor == "MM_2" && KeyZ && Ztyme == 1)
{
    sou(101);
    MM_Cursor = 1;
    Ztyme = 2;
    
    with (instance_create_depth(320, 165, -7777, oCC))
    {
        Seed = "DrawSelf";
        sprite_index = sTextHud_2;
        image_xscale = 10;
        image_yscale = 5;
    }
    
    with (instance_create_depth(280, 250, -9999, oTextEngine))
    {
        Cur = "MM_O_BACK";
        Text[0] = "Return";
        Mono = true;
        BC = false;
        Spez = "O_MM";
    }
    
    with (instance_create_depth(80, 60, -9999, oTextEngine))
    {
        Cur = 1;
        Text[0] = "Skip Intro";
        Mono = true;
        BC = false;
        Spez = "O_MM";
    }
    
    with (instance_create_depth(80, 100, -9999, oTextEngine))
    {
        Cur = 2;
        Text[0] = "No Hit";
        Mono = true;
        BC = false;
        Spez = "O_MM";
    }
    
    with (instance_create_depth(80, 140, -9999, oTextEngine))
    {
        Cur = 3;
        Text[0] = "Keyboard type";
        Mono = true;
        BC = false;
        Spez = "O_MM";
    }
}

if (MM_Cursor == 1 && KeyZ && Ztyme == 1)
{
    sou(101);
    audio_stop_sound(Hoagy_Time);
    scrSkipIntro();
    
    with (oEEF)
    {
        if (Seed == "Title")
            instance_destroy();
    }
}

if ((MM_Cursor == 2 || MM_Cursor == "s_MM6") && (KeyZ && Ztyme == 1))
{
    sou(101);
    
    if (oP.NoHit == "Disabled")
    {
        oP.NoHit = "Enabled";
        sctBumpText(MM_Cursor, 4);
    }
    else
    {
        oP.NoHit = "Disabled";
        sctBumpText(MM_Cursor, 3);
    }
}

if (MM_Cursor == 3 && KeyZ && Ztyme == 1)
{
    sou(101);
    
    if (oP.KeyT == 1)
        oP.KeyT = 2;
    else
        oP.KeyT = 1;
}
