var a = instance_place(x, y, obj_secretwall);
secretArray = (a != -4) ? a.tiles : [];

if (gamepad_button_check_pressed(global.player_input_device, gp_stickr)){
	global.showcollisions = !global.showcollisions;
	toggle_collision_function();
}

if (place_meeting(x, y, obj_exitgate) && state == UnknownEnum.Value_57)
{
    var check = false;
    
    with (instance_place(x, y, obj_exitgate))
        check = ds_list_find_index(global.SaveRoom, id) != -1;
    
    if (!check)
    {
        global.playmiliseconds = 0;
        global.playseconds = 0;
        global.playminutes = 0;
        global.playhour = 0;
    }
}

if (state != UnknownEnum.Value_57)
    image_blend = make_color_hsv(0, 0, 255);

if (state != UnknownEnum.Value_120)
    gumbobRollBounceBuff = 0;

if (state != UnknownEnum.Value_64 && state != UnknownEnum.Value_65 && state != UnknownEnum.Value_12)
    upsideDownJump = false;

if (!instance_exists(heatAfterEffectID))
{
    heatAfterEffectID = instance_create(x, y, obj_heatAfterEffect, 
    {
        playerID: id
    });
}

if (fireTrailBuffer > 0)
    fireTrailBuffer -= ((movespeed / 24) * 26);

if (fireTrailBuffer <= 0)
{
    if (movespeed >= 12 && (state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || (state == UnknownEnum.Value_3 && movespeed >= 12) || (state == UnknownEnum.Value_28 && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && movespeed >= 12)))
    {
        instance_create(x, y, obj_flameCloud, 
        {
            playerID: id
        });
    }
    
    fireTrailBuffer = 100;
}

if (state != UnknownEnum.Value_65 && state != UnknownEnum.Value_11 && state != UnknownEnum.Value_145 && state != UnknownEnum.Value_12)
    machFourMode = false;

if (room == realtitlescreen || room == rm_introVideo || room == scootercutsceneidk)
    state = UnknownEnum.Value_2;

if (grounded)
{
    gumbobPropellerFuel = gumbobPropellerFuelMax;
    groundedCot = true;
}

if (place_meeting(x, y, obj_toxicGasArea))
{
    toxicGasTime = approach(toxicGasTime, 0, 1);
    showToxicTimer = showToxicTimerMax;
    
    if (toxicGasTime <= 0)
        scr_playerrespawn(false);
}
else
{
    toxicGasTime = approach(toxicGasTime, toxicGasTimeMax, 2);
    
    if (toxicGasTime >= toxicGasTimeMax)
        showToxicTimer = approach(showToxicTimer, 0, 1);
}

if (y > (room_height + 400) && room != timesuproom && state != UnknownEnum.Value_134 && !instance_exists(obj_fadeoutTransition) && !instance_exists(obj_cutsceneManager))
    scr_playerrespawn();

if (state != UnknownEnum.Value_69 && state != UnknownEnum.Value_51 && state != UnknownEnum.Value_70 && state != UnknownEnum.Value_33)
    freeFallSmash = -14;

if (!global.freezeframe && state != UnknownEnum.Value_0)
{
    if (!instance_exists(baddieGrabbedID) && (state == UnknownEnum.Value_37 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_5))
        state = UnknownEnum.Value_1;
    
    if (state != UnknownEnum.Value_37 && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_33 && state != UnknownEnum.Value_86)
        baddieGrabbedID = -4;
}

if (character == UnknownEnum.Value_0)
{
    if (anger == 0)
    {
        angry = false;
    }
    else if (anger > 0)
    {
        angry = true;
        anger -= 1;
    }
}

if (sprite_index == spr_idle)
{
    if (global.Combo >= 25 && global.Combo < 50)
        sprite_index = spr_smallComboIdle;
    else if (global.Combo >= 50)
        sprite_index = spr_bigComboIdle;
}

scr_playersounds();

if (sprite_index == spr_player_PZ_tired && state != UnknownEnum.Value_1)
    windingAnim = 0;

if (suplexMove && grounded)
{
    suplexMove = false;
    flash = true;
}

if (angry && !instance_exists(angryCloudID) && state == UnknownEnum.Value_1)
{
    angryCloudID = instance_create(x, y, obj_angryCloud, 
    {
        playerID: id
    });
}

if (!global.freezeframe)
{
    global.ComboTime = clamp(global.ComboTime, 0, 60);
    
    if (global.ComboFreeze <= 0)
        global.ComboTime = approach(global.ComboTime, 0, 0.15);
}

if (room == souractive_tutorial)
    global.ComboFreeze = 75;

global.ComboFreeze--;
global.ComboFreeze = clamp(global.ComboFreeze, 0, 75);

if (global.ComboTime <= 0 && global.Combo != 0)
{
    if (global.Combo > 5)
        scr_queue_tvanim(obj_tv.happytvspr, 200);
    
    playComboVariable = -4;
    instance_destroy(obj_comboEndEffect);
    
    with (instance_create(832, 290, obj_comboEndEffect))
    {
        comboScore = global.ComboScore;
        title = floor(global.Combo / 5);
        very = floor(title / sprite_get_number(spr_comboTitles));
        subtractBy = round(global.ComboScore / 50);
        
        if (subtractBy < 25)
            subtractBy = 25;
        
        comboScoreMax = comboScore;
    }
    
    global.ComboScore = 0;
    global.ComboLost = true;
    global.Combo = 0;
}

if (inputBufferSecondJump < 8)
    inputBufferSecondJump++;

if (inputBufferHighJump < 8)
    inputBufferHighJump++;

inputBufferSecondJump = min(inputBufferSecondJump + 1, 8);
inputBufferHighJump = min(inputBufferHighJump + 1, 8);

if (keyParticles)
    instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);

if (!hurted)
    image_alpha = 1;

grabbing = state == UnknownEnum.Value_38 || state == UnknownEnum.Value_39 || state == UnknownEnum.Value_41 || state == UnknownEnum.Value_40;
var machslide_check = sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3FallStart || sprite_index == spr_machslideboost3Fall;
var killmove_states = [UnknownEnum.Value_65, UnknownEnum.Value_53, UnknownEnum.Value_151, UnknownEnum.Value_150, UnknownEnum.Value_105, UnknownEnum.Value_96, UnknownEnum.Value_87, UnknownEnum.Value_97, UnknownEnum.Value_139, UnknownEnum.Value_102, UnknownEnum.Value_100, UnknownEnum.Value_107, UnknownEnum.Value_36, UnknownEnum.Value_71, UnknownEnum.Value_94, UnknownEnum.Value_35, UnknownEnum.Value_79, UnknownEnum.Value_69, UnknownEnum.Value_58, UnknownEnum.Value_31, UnknownEnum.Value_5, UnknownEnum.Value_17, UnknownEnum.Value_18, UnknownEnum.Value_13, UnknownEnum.Value_9, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_88, UnknownEnum.Value_104, UnknownEnum.Value_46, UnknownEnum.Value_120, UnknownEnum.Value_119, UnknownEnum.Value_121, UnknownEnum.Value_122];

if (array_contains(killmove_states, state) || (state == UnknownEnum.Value_66 && machslide_check) || (state == UnknownEnum.Value_3 && movespeed >= 12) || (state == UnknownEnum.Value_152 && vsp > 0) || (state == UnknownEnum.Value_95 && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend) || (state == UnknownEnum.Value_11 && (verticalMovespeed > 8 || machTwo >= 100)) || (state == UnknownEnum.Value_145 && (movespeed > 8 || machTwo >= 100)) || (state == UnknownEnum.Value_12 && (verticalMovespeed > 8 || machTwo >= 100)) || (state == UnknownEnum.Value_78 && abs(movespeed) >= 10) || (state == UnknownEnum.Value_28 && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && movespeed >= 12) || (state == UnknownEnum.Value_33 && sprite_index == spr_piledriver) || (state == UnknownEnum.Value_33 && sprite_index == spr_player_PZ_pileDriver_intro) || (gumbobBounceCounter >= 3 && sprite_index != spr_player_PZ_cotton_attack))
    instakillmove = true;
else
    instakillmove = false;

if (flash && alarm[0] <= 0)
    alarm[0] = room_speed * 0.15;

if ((state != UnknownEnum.Value_55 && state != UnknownEnum.Value_61) || vsp < 0)
    fallingAnimation = 0;

if (state != UnknownEnum.Value_70 && state != UnknownEnum.Value_1 && state != UnknownEnum.Value_66)
    faceHurt = false;

if (state != UnknownEnum.Value_1 && state != UnknownEnum.Value_66)
    machSlideAnim = false;

if (state != UnknownEnum.Value_1)
{
    idle = 0;
    dashdust = 0;
}

if (state != UnknownEnum.Value_63 && state != UnknownEnum.Value_55 && state != UnknownEnum.Value_16 && state != UnknownEnum.Value_1 && state != UnknownEnum.Value_64 && state != UnknownEnum.Value_65 && state != UnknownEnum.Value_51 && state != UnknownEnum.Value_17 && state != UnknownEnum.Value_30 && state != UnknownEnum.Value_13 && state != UnknownEnum.Value_87 && state != UnknownEnum.Value_97)
    momemtum = false;

if (state != UnknownEnum.Value_64)
    machPunchAnim = false;

if (state != UnknownEnum.Value_55)
    ladderBuffer = 0;

if (state != UnknownEnum.Value_55)
    stompAnim = false;

if ((state == UnknownEnum.Value_65 || (state == UnknownEnum.Value_3 && movespeed >= 12) || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_5 || (state == UnknownEnum.Value_66 && machTwo >= 100) || (state == UnknownEnum.Value_28 && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && movespeed >= 12) || state == UnknownEnum.Value_16 || state == UnknownEnum.Value_79 || state == UnknownEnum.Value_96 || state == UnknownEnum.Value_100 || (state == UnknownEnum.Value_103 && sprite_index != spr_player_PN_sideSuperJump_prep) || state == UnknownEnum.Value_125) || state == UnknownEnum.Value_121)
{
    machAfterimage--;
    
    if (machAfterimage <= 0)
    {
        create_afterimage(choose(UnknownEnum.Value_1, UnknownEnum.Value_2), xscale, true);
        machAfterimage = 6;
    }
}
else
{
    machAfterimage = 0;
}

if (state != UnknownEnum.Value_67 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_127 && state != UnknownEnum.Value_128 && state != UnknownEnum.Value_60 && state != UnknownEnum.Value_9 && state != UnknownEnum.Value_29 && state != UnknownEnum.Value_95 && sprite_index != spr_null && sprite_index != spr_player_PZ_frostburn_land_spin && state != UnknownEnum.Value_59 && state != UnknownEnum.Value_28 && state != UnknownEnum.Value_68 && state != UnknownEnum.Value_62 && state != UnknownEnum.Value_61 && sprite_index != spr_player_PN_crouchSlip && state != UnknownEnum.Value_121)
    mask_index = spr_player_mask;
else
    mask_index = spr_crouchmask;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || (place_meeting(x, y, obj_startgate) && state != UnknownEnum.Value_56) || place_meeting(x, y, obj_janitorDoor) || place_meeting(x, y, obj_keydoorclock) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && (global.panic == 1 && room != sucrose_1))) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == UnknownEnum.Value_1)
    instance_create(x, y, obj_uparrow);

if (((state == UnknownEnum.Value_64 && sprite_index != spr_mach1) || state == UnknownEnum.Value_65) && !instance_exists(obj_speedlines))
{
    instance_create(x, y, obj_speedlines, 
    {
        playerID: id
    });
}

if (state == UnknownEnum.Value_105)
{
    blueAfterimage--;
    
    if (blueAfterimage <= 0)
    {
        create_afterimage(choose(UnknownEnum.Value_4, UnknownEnum.Value_5), xscale, true);
        blueAfterimage = 6;
    }
}
else
{
    blueAfterimage = 0;
}

if (character != UnknownEnum.Value_3 || (grounded && !key_attack) || state == UnknownEnum.Value_68)
    gumbobBounceCounter = 0;

if (superTauntBuffer >= 10 && state != UnknownEnum.Value_42)
{
    if (!superTauntCharged)
        event_play_oneshot("event:/SFX/player/gotsupertaunt", x, y);
    
    superTauntCharged = true;
}

if (place_meeting(x, y + 9, obj_molassesGround))
{
    if (hsp != 0 && (floor(image_index) % 4) == 0 && grounded)
    {
        create_debris(x, y + 43, spr_molassesgoop);
        event_play_oneshot("event:/SFX/player/goopfloor", x, y);
    }
    
    if (state == UnknownEnum.Value_11 && vsp < 0)
        state = UnknownEnum.Value_1;
    
    if (vsp < 0 && grounded)
    {
        vsp /= 2;
        create_debris(x, y + 43, spr_molassesgoop);
        event_play_oneshot("event:/SFX/player/goopjump", x, y);
    }
}

if (place_meeting(x, y + 3, obj_icyGround) && grounded)
{
    if (sign(hsp) != sign(prevHsp))
        slideHsp += (prevHsp / 1.5);
    
    if (scr_slope())
        slideHsp += (0.25 * slopeMomentum_acceleration());
}
else if (grounded)
{
    slideHsp = approach(slideHsp, 0, 0.35);
}

if (!grounded)
    slideHsp = approach(slideHsp, 0, 0.6);

slideHsp = approach(slideHsp, 0, 0.15);
slideHsp = clamp(abs(slideHsp), 0, 3) * sign(slideHsp);

if (state == UnknownEnum.Value_145 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_11)
    slideHsp = 0;

if (state != UnknownEnum.Value_91)
    bushDetection = 0;

if (global.StarMode && state == UnknownEnum.Value_65)
    movespeed = min(movespeed, 12);

dashpadBuffer = max(dashpadBuffer - 1, 0);
kungBuffer = max(kungBuffer - 1, 0);

if (sprite_index == spr_player_PZ_mach2_hit2 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach2;

if (sprite_index == spr_player_PZ_mach2_hit1 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach2;

global.HighestCombo = max(global.Combo, global.HighestCombo);

if (paletteWave)
    paletteSelect = wave(1, sprite_get_width(paletteSprite) - 1, 0, 1);

if (surface_exists(surfacePallete) && paletteSelect >= (sprite_get_width(paletteSprite) - 1))
    customPalette = true;
else if (paletteSelect < (sprite_get_width(paletteSprite) - 1))
    customPalette = false;

if (state != UnknownEnum.Value_115 && state != UnknownEnum.Value_0)
    inhaleStrength = 0;

if (kungAirCount)
    kungAirTime++;

if (state != UnknownEnum.Value_105 && state != UnknownEnum.Value_0)
{
    kungAirCount = false;
    kungAirTime = 0;
}

var c_title = floor(global.Combo / 5);
c_title = clamp(c_title, 0, sprite_get_number(spr_comboTitles));

if (oldComboTitle != c_title && c_title > 0)
{
    oldComboTitle = c_title;
    instance_destroy(comboTitle);
    comboTitle = -4;
    comboTitle = instance_create(830, 250, obj_comboTitleEffect);
    comboTitle.title = c_title - 1;
    comboTitle.image_index = c_title - 1;
}
