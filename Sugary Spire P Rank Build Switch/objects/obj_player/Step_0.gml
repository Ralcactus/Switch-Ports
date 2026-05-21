if (gamepad_button_check_pressed(global.player_input_device, gp_stickr)){
	global.showcollisions = !global.showcollisions;
	toggle_collision_function()
}

audio_emitter_position(playerSound, x, y, 0);
audio_emitter_gain(playerSound, global.soundVolume);
var a = instance_place(x, y, obj_secret_tiles);
secret_array = (a != -4) ? a.tiles : ["-4"];

if (place_meeting(x, y, obj_exitgate) && state == states.comingoutdoor)
{
    var _check = false;
    
    with (instance_place(x, y, obj_exitgate))
        _check = ds_list_find_index(global.saveroom, id) != -1;
    
    if (!_check)
    {
        global.playmiliseconds = 0;
        global.playseconds = 0;
        global.playminutes = 0;
        global.playhour = 0;
    }
}

if (state != states.comingoutdoor)
    image_blend = make_color_hsv(0, 0, 255);

if (state != states.mach2 && state != states.mach3 && state != states.climbdownwall)
    upsideDownJump = false;

if (!instance_exists(obj_heataftereffect))
    instance_create(x, y, obj_heataftereffect);

if (firetrailbuffer > 0)
    firetrailbuffer -= ((movespeed / 24) * 26);

if (firetrailbuffer <= 0)
{
    if (movespeed >= 12 && (state == states.mach2 || state == states.mach3 || (state == states.machroll && sprite_index != spr_crouchslip && movespeed >= 12)))
        instance_create(x, y, obj_flamecloud);
    
    firetrailbuffer = 100;
}

if (state != states.mach3 && state != states.climbwall && state != states.climbceiling && state != states.climbdownwall)
    mach4mode = false;

if (room == realtitlescreen || room == rm_introVideo || room == scootercutsceneidk)
    state = states.titlescreen;

if (grounded)
    groundedcot = 1;

if (y > (room_height + 400))
    scr_playerrespawn();

if (state != states.freefall && state != states.freefallprep && state != states.freefallland && state != states.superslam)
    freefallsmash = 0;

if (!global.freezeframe && state != states.frozen)
{
    if (!instance_exists(baddiegrabbedID) && (state == states.grab || state == states.superslam || state == states.charge))
        state = states.normal;
    
    if (!(state == states.grab || state == states.charge || state == states.superslam || state == states.finishingblow))
        baddiegrabbedID = noone;
}

if (character == "P")
{
    if (anger == 0)
        angry = 0;
    
    if (anger > 0)
    {
        angry = 1;
        anger -= 1;
    }
}

if ((angry == 1 || global.stylethreshold > 3) && sprite_index == spr_idle)
    sprite_index = spr_angryidle;

scr_playersounds();

if (sprite_index == spr_player_winding && state != states.normal)
    windingAnim = 0;
else
    audio_stop_sound(sound_superjumpcharge2);

if (suplexmove == true && grounded)
{
    suplexmove = false;
    flash = true;
}

if (obj_player.state != states.handstandjump)
    grav = 0.5;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, 5), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (angry == 1 && !instance_exists(obj_angrycloud) && obj_player.state == states.normal)
    instance_create(x, y, obj_angrycloud);

if (!global.freezeframe)
{
    global.combotime = clamp(global.combotime, 0, 60);
    
    if (global.combofreeze <= 0)
        global.combotime = approach(global.combotime, 0, 0.15);
}

global.combofreeze--;
global.combofreeze = clamp(global.combofreeze, 0, 75);

if (global.combotime <= 0 && global.combo != 0)
{
    if (global.combo > 5)
        scr_queue_tvanim(obj_tv.happytvspr, 200);
    
    global.combo = 0;
    playComboVariable = noone;
}

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (key_particles == 1)
    instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);

if (inv_frames == 0 && hurted == 0)
    image_alpha = 1;

if (state == states.mach2 || state == states.pizzanokungfu || state == states.bottlerocket || state == states.charge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.machroll || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1;
else
    attacking = 0;

if (state == states.Throw || state == states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1;
else
    grabbing = 0;

var _machslideCheck = sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3FallStart || sprite_index == spr_machslideboost3Fall;

if ((state == states.mach3 || (state == states.machslide && _machslideCheck) || state == states.slipnslide || state == states.rupertslide || state == states.rupertnormal || (state == states.rupertjump && vsp > 0) || (state == states.tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend) || (state == states.climbwall && (verticalMovespeed > 8 || mach2 >= 100)) || (state == states.climbceiling && (movespeed > 8 || mach2 >= 100)) || (state == states.climbdownwall && (verticalMovespeed > 8 || mach2 >= 100)) || state == states.frostburnspin || state == states.pizzanokungfu || (state == states.cottonroll && movespeed > 8) || state == states.bottlerocket || state == states.machtumble || state == states.minecart || state == states.fireass || state == states.puddle || state == states.Nhookshot || state == states.skateboard || state == states.chainsaw || state == states.freefall || state == states.Sjump || (state == states.machroll && movespeed >= 12) || state == states.machfreefall || state == states.charge || (state == states.superslam && sprite_index == spr_piledriver) || (state == states.superslam && sprite_index == spr_player_piledriverstart) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball) || state == states.uppercut || state == states.pizzanomach || state == states.ufodash)
    instakillmove = 1;
else
    instakillmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != states.mach3 && state != states.machslide)
    autodash = 0;

if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0;

if (state != states.freefallland && state != states.normal && state != states.machslide)
    facehurt = 0;

if (state != states.normal && state != states.machslide)
    machslideAnim = 0;

if (state != states.normal)
{
    idle = 0;
    dashdust = 0;
}

if (state != states.mach1 && state != states.jump && state != states.Nhookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes && state != states.cotton && state != states.cottonroll)
    momemtum = 0;

if (state != states.Sjump && state != states.Sjumpprep)
    a = 0;

if (state != states.facestomp)
    facestompAnim = 0;

if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0;

if (state != states.mach2)
    machpunchAnim = 0;

if (state != states.jump)
    ladderbuffer = 0;

if (state != states.jump)
    stompAnim = 0;

if (toomuchalarm1 > 0)
    toomuchalarm1 -= 1;

if (state == states.mach3 || state == states.Nhookshot || state == states.mach2 || state == states.charge || (state == states.machslide && mach2 >= 100) || (state == states.machroll && sprite_index != spr_crouchslip && movespeed >= 12) || state == states.handstandjump || state == states.cottondrill || state == states.minecart || (state == states.pizzanosidejump && sprite_index != spr_pizzano_sjumpprepside) || state == states.pizzanoshoulderbash || (state == states.chainsaw && mach2 >= 100))
{
    mach_aftimg--;
    
    if (mach_aftimg <= 0)
    {
        create_afterimage(choose(afterimages.blue, afterimages.pink), xscale, true);
        mach_aftimg = 6;
    }
}
else
    mach_aftimg = 0;

if (state != states.bump && state != states.cottonroll && state != states.crouch && state != states.boxxedpep && state != states.pistol && state != states.tumble && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_skatecrouch && state != states.Sjumpprep && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump && sprite_index != spr_pizzano_crouchslide)
    mask_index = spr_player_mask;
else
    mask_index = spr_crouchmask;

if (state != states.hurt)
    hurtsound = 0;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || (place_meeting(x, y, obj_startgate) && state != states.victory) || place_meeting(x, y, obj_janitorDoor) || place_meeting(x, y, obj_keydoorclock) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && (global.panic == 1 && room != sucrose_1))) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal)
    instance_create(x, y, obj_uparrow);

if (((state == states.mach2 && sprite_index != spr_mach1) || state == states.mach3) && !instance_exists(obj_speedlines))
    instance_create(x, y, obj_speedlines, { playerID: id });

if (state == states.pizzanokungfu)
{
    blue_aftimg--;
    
    if (blue_aftimg <= 0)
    {
        create_afterimage(choose(afterimages.solid_blue, afterimages.solid_pink), xscale, true);
        blue_aftimg = 6;
    }
}
else
    blue_aftimg = 0;

if (state != states.backbreaker)
{
    if (global.combo >= 3 && supertauntbuffer < 500 && supertauntcharged == false)
        supertauntbuffer++;
    
    if (supertauntbuffer >= 500 && supertauntcharged == false && state != states.backbreaker)
    {
        scr_sound(sound_gotsupertaunt);
        supertauntbuffer = 500;
        supertauntcharged = true;
    }
    
    if (global.combo < 3)
    {
        supertauntbuffer = 0;
        supertauntcharged = false;
    }
    
    if (supertauntcharged == true && room != rank_room)
    {
        if (!instance_exists(supertaunteffect))
            supertaunteffect = instance_create(x, y, obj_supertaunteffect, { playerID: other.id });
    }
}

scr_collide_destructibles();

if (place_meeting(x, y + 1, obj_molassesGround))
{
    if ((hsp != 0 && (floor(image_index) % 4) == 0) && grounded)
    {
        with (instance_create(x, y + 43, obj_debris))
        {
            sprite_index = spr_molassesgoop;
            image_index = irandom_range(0, 5);
        }
    }
    
    if (state == states.climbwall && vsp < 0)
        state = states.normal;
    
    if (state == states.frostburnwallrun && vsp < 0)
        state = states.frostburn;
    
    if (vsp < 0 && grounded)
    {
        vsp /= 2;
        
        with (instance_create(x, y + 43, obj_debris))
        {
            sprite_index = spr_molassesgoop;
            image_index = irandom_range(0, 5);
        }
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
    slideHsp = approach(slideHsp, 0, 0.35);

if (!grounded)
    slideHsp = approach(slideHsp, 0, 0.6);

slideHsp = approach(slideHsp, 0, 0.15);
slideHsp = clamp(abs(slideHsp), 0, 3) * sign(slideHsp);

if (state == states.climbceiling || state == states.climbdownwall || state == states.climbwall)
    slideHsp = 0;

if (state != states.bushdisguise)
    bushdetection = 0;

if (state != states.crouch)
    crouchjumptimer = 0;

if (state != states.pizzanopummel && state != states.frozen)
{
    pummelhit = 0;
    pummelfinish = 0;
}

if (gumbobpropellercooldown > 0)
    gumbobpropellercooldown--;

if (global.starrmode == 1)
{
    if (global.starrmode == 1 && state == states.mach3)
        movespeed = 12;
    else if (state == states.mach3 && movespeed > 12)
        movespeed = 12;
}

if (state == states.door || place_meeting(x, y, obj_hallway) || state == states.victory)
    global.roomsave = 0;

if (Dashpad_buffer > 0)
    Dashpad_buffer = max(Dashpad_buffer - 1, 0);

if (sprite_index == spr_player_machpunch1 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach2;

if (sprite_index == spr_player_machpunch2 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach2;

if (global.combo > global.highestcombo)
    global.highestcombo = global.combo;

if (palettewave == true)
    paletteselect = wave(1, sprite_get_width(spr_palette) - 1, 0, 1);

if (surface_exists(surf_pallete) && paletteselect >= (sprite_get_width(spr_palette) - 1))
    custompalette = true;
else if (paletteselect < (sprite_get_width(spr_palette) - 1))
    custompalette = false;

if (state != states.coneboyinhale && state != states.frozen)
    inhalestrength = 0;

if (kungaircount == 1)
    kungairtime += 1;

if (state != states.pizzanokungfu && state != states.frozen)
{
    kungaircount = 0;
    kungairtime = 0;
}

var _cTitle = floor(global.combo / 5);
_cTitle = clamp(_cTitle, 0, sprite_get_number(spr_combotitles) - 1);

if (oldComboTitle != _cTitle && _cTitle != 0)
{
    oldComboTitle = _cTitle;
    instance_destroy(combo_title);
    combo_title = noone;
    combo_title = instance_create(830, 250, obj_combotitle);
    combo_title.title = _cTitle;
    combo_title.image_index = _cTitle;
}

if (!ds_list_empty(sour_buddies))
{
    var _size = ds_list_size(sour_buddies);
    var sourreduction = 1 + (_size / 15);
    
    if (vsp < 0 && grounded)
        vsp /= sourreduction;
    
    hsp /= sourreduction;
    
    if (sour_buddies_timer > 0)
        sour_buddies_timer--;
    else if (key_jump || key_slap2 || key_right2 || key_left2 || key_attack2 || state == states.mach3)
    {
        var _range = irandom_range(0, _size);
        ds_list_delete(sour_buddies, _range);
        sour_buddies_timer = irandom_range(5, 25);
    }
}

if (state != states.smirk)
    ufomaxspeed = 0;

if (obj_player.state != states.seacream && obj_player.state != states.seacreamjump && obj_player.state != states.seacreamstick)
    additionalspeedvar = 0;

if (keyboard_check_pressed(vk_pageup))
    patternnumb += 1;

if (keyboard_check_pressed(vk_pagedown))
    patternnumb -= 1;

patternnumb %= 2;
patternspr = asset_get_index("spr_pattern" + string(patternnumb));
