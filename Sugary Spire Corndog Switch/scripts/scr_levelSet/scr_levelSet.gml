function scr_levelSet()
{
    randomize();
    global.RandomSeed = random_get_seed();
    global.MinesFlags[UnknownEnum.Value_0] = false;
    global.MinesFlags[UnknownEnum.Value_1] = false;
    global.MinesFlags[UnknownEnum.Value_2] = false;
    global.MinesFlags[UnknownEnum.Value_3] = false;
    global.MinesFlags[UnknownEnum.Value_4] = false;
    global.MinesFlags[UnknownEnum.Value_5] = false;
    global.MinesFlags[UnknownEnum.Value_6] = false;
    global.SouractiveProgression = 0;
    instance_destroy(obj_endlevelfade);
    
    if (object_index != obj_fadeoutTransition)
        instance_destroy(obj_fadeoutTransition);
    
    instance_destroy(obj_cutsceneManager);
    instance_destroy(obj_coneball_timesUp);
    instance_destroy(obj_snowwalkparticles);
    instance_destroy(obj_cafedrawer);
    instance_destroy(obj_discoball);
    instance_destroy(obj_discoball);
    instance_destroy(obj_sucroseTimer);
    instance_destroy(obj_devilboy);
    instance_destroy(obj_lap2visual);
    global.CafeDrawer = -4;
    global.cutsceneManager = -4;
    
    if (instance_exists(obj_cutsceneManager))
        instance_destroy(obj_cutsceneManager);
    
    global.ExitGateTaunt = 0;
    global.martian_alarmed = false;
    global.freezeframe = false;
    global.greyscalefade = 0;
    global.fill = 4000;
    global.seconds = 59;
    global.treat = false;
    global.minutes = 1;
    global.ComboFreeze = 0;
    global.ComboScore = 0;
    global.secretfound = 0;
    global.playmiliseconds = 0;
    global.playseconds = 0;
    global.playminutes = 0;
    global.playhour = 0;
    global.panic = 0;
    global.style = 0;
    global.stylethreshold = 0;
    global.hurtcounter = 0;
    global.hurtmilestone = 0;
    global.minesProgress = false;
    global.rocketLauncher = false;
    global.tempRocketLauncher = false;
    global.PokerChips = 0;
    obj_parent_player.visible = true;
    camera_set_view_angle(view_camera[0], 0);
    ds_list_clear(global.SaveRoom);
    ds_list_clear(global.EscapeRoom);
    ds_list_clear(global.BaddieRoom);
    instance_destroy(obj_confectimallow);
    instance_destroy(obj_confecticrack);
    instance_destroy(obj_confectichoco);
    instance_destroy(obj_confectiworm);
    instance_destroy(obj_confecticandy);
    instance_destroy(obj_icegrandson);
    instance_destroy(obj_rudejanitor);
    instance_destroy(obj_lapjanitor);
    instance_destroy(obj_spookey);
    ds_list_clear(global.FollowerList);
    ds_list_clear(global.KeyFollowerList);
    global.MallowFollow = false;
    global.CrackFollow = false;
    global.ChocoFollow = false;
    global.WormFollow = false;
    global.CandyFollow = false;
    global.Donutfollow = false;
    global.janitorRudefollow = false;
    global.janitorLapfollow = false;
    global.Treasure = false;
    global.lapcount = 0;
    global.lapmusic = false;
    ini_open("saveData.ini");
    var ranks = ini_read_string("Ranks", string(global.levelname), "none");
    ini_close_os();
    ini_open("saveData.ini");
    global.kungAirTime = ini_read_string("achievments", "kungAirTime", 0);
    ini_close_os();
    global.showplaytimer = ranks != "none";
    
    with (obj_camera)
    {
        ds_list_clear(cameraShakeList);
        NextFreeze = false;
        DrawHUD = true;
        DrawY = 0;
        global.targetCamX = obj_parent_player.x;
        global.targetCamY = obj_parent_player.y;
        var target = obj_parent_player;
        var _cam_x = target.x - (camera_get_view_width(view_camera[0]) / 2);
        var _cam_y = target.y - (camera_get_view_height(view_camera[0]) / 2);
        chargeCameraX = 0;
        chargeCameraY = 0;
        _cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width) - camera_get_view_width(view_camera[0]));
        _cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height) - camera_get_view_height(view_camera[0]));
        _cam_x = clamp(_cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
        _cam_y = clamp(_cam_y, 0, room_height - camera_get_view_height(view_camera[0]));
        Cam_x = _cam_x;
        Cam_y = _cam_y;
        cam_langle = 0;
        cam_lzoom = 1;
        cam_angle = 0;
        cam_zoom = 1;
        oldPointCollect = 0;
        pointCollectShake = 0;
    }
    
    with (obj_parent_player)
    {
        conveyorHsp = 0;
        character = mainPlayerCharacter;
        previousCharacter = mainPlayerCharacter;
        inBackgroundLayer = false;
        transfoSound = undefined;
        oldTransfoSound = undefined;
        oldComboTitle = 0;
        gumbobPropellerFuel = gumbobPropellerFuelMax;
        upsideDownJump = false;
        machFourMode = false;
        grabClimbBuffer = 0;
        crouchSlipBuffer = 0;
        crouchSlipAntiBuffer = 0;
        hsp = 0;
        vsp = 0;
        hspCarry = 0;
        vspCarry = 0;
        fracHsp = 0;
        fracVsp = 0;
        true_hsp = 0;
        true_vsp = 0;
        prevHsp = 0;
        prevVsp = 0;
        slideHsp = 0;
        draw_angle = 0;
        slopeAngle = 0;
        secretPortal = false;
        scale = 1;
        toxicGasTime = toxicGasTimeMax;
        showToxicTimer = 0;
        groundedSlope = false;
        targetDoor = "A";
        fireTrailBuffer = 0;
        state = UnknownEnum.Value_57;
        image_index = 0;
        sprite_index = spr_walkfront;
        sJumpCanDoubleJump = true;
        playComboVariable = -4;
        resetMusic = false;
        dashpadBuffer = 0;
        dashpadBuffer = 0;
        vertical = false;
        verticalOffset = 0;
        superTauntBuffer = 0;
        superTauntCharged = false;
        scr_characterSprite();
        
        for (var i = 0; i < 11; i++)
            alarm[i] = -1;
        
        grav = 0.5;
        hsp = 0;
        vsp = 0;
        xscale = 1;
        yscale = 1;
        steppy = false;
        movespeedmax = 5;
        jumpStop = false;
        visible = true;
        turn = 0;
        jumpAnim = true;
        landAnim = false;
        machSlideAnim = false;
        crouchAnim = true;
        stompAnim = false;
        turning = 0;
        hurted = false;
        machTwo = 0;
        inputBufferJump = 0;
        inputBufferSecondJump = 8;
        inputBufferHighJump = 8;
        targetRoom = rm_missing;
        flash = false;
        global.Collect = 0;
        global.ComboScore = 0;
        global.Treasure = false;
        global.Combo = 0;
        global.HighestCombo = 0;
        global.ComboTime = 0;
        global.ComboLost = false;
        global.ToppinTotal = 1;
        keyParticles = false;
        idle = 0;
        machPunchAnim = false;
        punch = false;
        windingAnim = 0;
        ladderBuffer = 0;
        dashdust = 0;
        throwforce = 0;
        idleAnim = 0;
        momemtum = false;
        cutscene = false;
        grabbing = false;
        dir = xscale;
        shotgunAnim = false;
        fallingAnimation = 0;
        bombPepTimer = 100;
        slapbuffer = 0;
        slaphand = 1;
        suplexMove = false;
        timeuntilhpback = 300;
        anger = 0;
        angry = false;
        colors[0] = choose(0, 1, 2, 3);
        headless = false;
        substate = 0;
        hp = 6;
        global.rocketLauncher = false;
    }
    
    with (obj_tv)
    {
        image_index = 0;
        sprite_index = spr_tvoff;
        controlprompt = "Placeholder Prompt Text";
        promptalpha = 0;
        nexttext = "Nil";
        promptappear = false;
        promptappeared = false;
        prompt_timer = 0;
        sucroseTimer = false;
        ComboShake = false;
        combofade = 0;
        comboendImage = 0;
        comboendSprite = spr_badcombo_boil;
        combocanFade = true;
        chooseOnecomboend = true;
        tvlength = 0;
        ds_queue_clear(global.newhudtvanim);
        ds_queue_clear(global.newhudmessage);
        alarm[1] = 1;
        staticdraw = false;
        DrawY = 0;
        shownranka = 0;
        shownrankb = 0;
        shownrankc = 0;
    }
    
    stop_music(true);
    fmod_global_setParameter("transfo", false, true);
    
    with (obj_music)
    {
        global.RoomMusic = undefined;
        global.RoomIsSecret = false;
        currentSecretStatus = false;
        panicStart = false;
    }
}
