function player_voice_random()
{
    var i = random_range(1, 10);
    
    if (i >= 3)
        scr_fmod_soundeffect(voicerandom, x, y);
}

function player_voice_hurt()
{
    var i = random_range(1, 10);
    
    if (i >= 3)
        scr_fmod_soundeffect(voicehurt, x, y);
}

enum playerdeath
{
	normal,
	gibdeath,
	firedeath
}

function scr_hurtplayer(damage = 1, deathtype = playerdeath.normal, override = false, mvspeed = 1)
{
    with (obj_player)
    {
        if (global.godmode)
            return false;
        
        if (state == states.hitstun)
            return false;
        
        if (state == states.dead)
            return false;
        
        var _hpmul = max(1, damage / 2);
        
        if (wrathofcortex)
        {
            event_play_oneshot("event:/sfx/misc/wrathofcortex");
            save_easteregg("gatherTheGemsNotTheCrystals");
        }
        
        if ((state != states.hurt && !hurt) || (state != states.hurt && override))
        {
            var _prevhp = hp;
            hp = max(hp - damage, 0);
            
			// Stun if some HP left
            if (hp > 0)
            {
                state = states.hurt;
                hurt = 1;
                sprite_index = choose(spr_player_hurt, spr_player_hurt2);
                movespeed = -2 * mvspeed;
                vsp = -10;
                
                if (_prevhp > hp)
                    scr_fmod_soundeffectONESHOT("event:/sfx/player/voice/hearthurt", obj_playerheart.x, obj_playerheart.y);
                
                repeat (5)
                    scr_createparticle(false, x, y, depth, spr_star, 1, 1, irandom(4), 0, irandom(360), 0.5, irandom_range(-6, 6), irandom_range(-8, -4), irandom_range(-1, 1));
                
                player_voice_hurt();
                gamepadvibrate(0.2, 0, 20);
            }
			// Kill the Noise
			// if no HP left
            else
            {
                hsp = 0;
                vsp = 0;
                movespeed = 0;
                _hpmul += 1;
                
                if (!in_deathroute())
                    global.playerhit = true;
                
                switch (deathtype)
                {
                    case playerdeath.firedeath:
                        scr_fmod_soundeffectONESHOT("event:/sfx/player/firedeath", x, y);
                        state = states.dead;
                        sprite_index = spr_player_firedeath;
                        image_index = 0;
                        instance_create_depth(x, y, -12500, obj_deathtransition2);
                        gamepadvibrate(0.4, 0, 35);
                        break;
                    
                    case playerdeath.normal:
                        state = states.dead;
                        sprite_index = spr_player_dead;
                        image_index = 0;
                        instance_create_depth(x, y, -12500, obj_deathtransition2);
                        scr_fmod_soundeffect(deadblowsnd, x, y);
                        gamepadvibrate(0.2, 0, 20);
                        break;
                    
                    case playerdeath.gibdeath:
                        state = states.dead;
                        sprite_index = spr_player_nothing;
                        image_index = 0;
                        
                        for (var i = 0; i < (sprite_get_number(spr_player_gibs) - (2 * !wrathofcortex)); i++)
                        {
                            var _zadd = irandom_range(4, -4);
                            
                            with (instance_create_depth(x, y, depth - _zadd, obj_playergib))
                            {
                                image_index = i;
                                hsp = random_range(-1, 1);
                                vsp = random_range(-15, -19);
                                z = other.z + _zadd;
                                curpalette = other.curpalette;
                            }
                        }
                        
                        with (instance_create_depth(x, y, -12500, obj_deathtransition1))
                            alarm[0] = 220;
                        
                        gamepadvibrate(0.8, 0, 35);
                        break;
                }
            }
            
            shakecam(30 * _hpmul, 5);
            obj_drawcontroller.noisehudshaketime = 15 * _hpmul;
            obj_drawcontroller.hpatimer = 180 * _hpmul;
            scr_fmod_soundeffect(hurtsnd, x, y);
            return true;
        }
    }
    
    return false;
}

function player_save_state()
{
    with (obj_player)
    {
        playersavedstate = 
        {
            state: state,
            sprite_index: sprite_index,
            mask_index: mask_index,
            image_index: image_index,
            image_speed: image_speed,
            movespeed: movespeed,
            hsp: hsp,
            vsp: vsp
        };
    }
}

function player_restore_state()
{
    with (obj_player)
    {
        state = playersavedstate.state;
        sprite_index = playersavedstate.sprite_index;
        mask_index = playersavedstate.mask_index;
        image_index = playersavedstate.image_index;
        image_speed = playersavedstate.image_speed;
        movespeed = playersavedstate.movespeed;
        hsp = playersavedstate.hsp;
        vsp = playersavedstate.vsp;
    }
}

function hitstun(_time)
{
    with (obj_player)
    {
        player_save_state();
        hitstuntime = _time;
        state = states.hitstun;
    }
    
    with (par_enemy)
        hitstuntime = _time;
}

function player_reset(_restart_music = true, _restart_level = true, _restart_HUD = true)
{
    with (obj_player)
    {
        z = nonplatZ;
        depth = nonplatZ;
        grav = 0.5;
        move = 0;
        movespeed = 0;
        image_xscale = 1;
        visible = true;
        image_alpha = 1;
        state = states.normal;
        afterimagetime = 0;
        mach4mode = 0;
        dir = image_xscale;
        image_speed = 0.35;
        hp = 1;
        angle = 0;
        jumpstop = 0;
        hurt = 0;
        decel = 0;
        momentum = 0;
        lastslipperyplat = noone;
        movingplatID = noone;
        landanim = 0;
        palettespr = spr_noisepalette;
        onslipperyplat = false;
        particlecooldown1 = 0;
        particlecooldown2 = 0;
        particlecooldown3 = 0;
        particlecooldown4 = 0;
        particlecooldown5 = 0;
        particlecooldown6 = 0;
        coyotetime = 7;
        speedlinesobj = noone;
        jumpbuffer = 0;
        attackbuffer = 0;
        slidebuffer = 0;
        movestop = 0;
        nextpunch = 0;
        lastpunch = 0;
        punchair = 1;
        cartwheelcooldown = 0;
        mach3crashtimer = 0;
        hitstuntime = 0;
        ropeID = noone;
        targetdoor = 0;
        targetroom = noone;
        ondeathplatform = noone;
        diddeathroute = false;
        targetouthouse = noone;
        canchangedir = 1;
        platformspin = 45;
        showturnsprite = false;
        platformtargetpos = 0;
        platformstartpos = 0;
        slidetime = 18;
        crouchjump = 0;
        xprev = x;
        bouncecombo = 0;
        ropexstartpos = 0;
        ropeystartpos = 0;
        ropel = 0;
        nointro = false;
        sendtocheckpoint = false;
        hovering = 0;
        hovertime = 0;
        fakewalktime = 0;
        outofhallway = true;
        verticalhallway = false;
        verticalhallwayposoffset = 0;
        wrathofcortex = false;
        outhousestartx = 0;
        outhousestarty = 0;
        outhousegoin = true;
        playersavedstate = 
        {
            state: state,
            sprite_index: sprite_index,
            mask_index: mask_index,
            image_index: image_index,
            image_speed: image_speed
        };
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        
        if (_restart_level)
        {
            beforedeathroute = 
            {
                room: Patch3A,
                path: pth_deathroutealt
            };
            currcheckpoint.id = noone;
            currcheckpoint.object_index = noone;
            currcheckpoint.room = noone;
            currcheckpoint.x = 0;
            currcheckpoint.y = 0;
            currcheckpoint.destroyedcount = 0;
            ds_map_clear(currcheckpoint.respawnroom);
            global.switchstate = true;
            global.collect = 0;
            global.combo = 0;
            global.pumpkintotal = 0;
            global.destroyedcount = 0;
            global.timer = 0;
            global.gems = 0;
            global.playerhit = 0;
            ds_map_clear(global.saveroom);
            ds_map_clear(global.respawnroom);
            
            with (obj_deathplatform)
                persistent = false;
            
            with (obj_levelmap)
            {
                visitedrooms = -1;
                visitedrooms = array_create(array_length(global.levelrooms) - 4, false);
                roominfo_outhouses = array_create(0);
            }
            
            reroll();
        }
    }
    
    with (par_collect)
    {
        collected = false;
        splitcounter = 0;
        magnetised = 0;
    }
    
    with (obj_drawcontroller)
    {
        camForward = 0;
        camUp = 0;
        camshake = 0;
        camXINTERP = 0;
        camYINTERP = 0;
        curlock = noone;
        curlockbboxdata = [];
        prevlock = curlock;
        prevlockbboxdata = curlockbboxdata;
        interpplaypos = false;
        prevpx = 0;
        prevpy = 0;
        shake_mag = 0;
        shake_mag_acc = 0;
        hpalpha = 0;
        collectalpha = 0;
        pumpkinalpha = 0;
        cratealpha = 0;
        gemalpha = 0;
        hpatimer = 0;
        collectatimer = 0;
        comboatimer = 0;
        pumpkinatimer = 0;
        crateatimer = 0;
        gematimer = 0;
        scoreshake = array_create(0);
        scorepal = array_create(0);
        prevcollect = -1;
        showhovertimer = false;
        hovertimerfade = 0;
        hovertimerflash = 0;
    }
    
    with (obj_playerheart)
        visible = false;
    
    fmod_studio_system_set_parameter_by_name("bringtorank", false, true);
    
    if (_restart_music)
    {
        with (obj_music)
        {
            if (global.music != noone)
            {
                if (global.music.event != noone)
                    fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", 0, true);
                
                global.music = noone;
            }
        }
    }
    
    if (_restart_HUD)
    {
        instance_destroy(obj_deathroutetransition);
        instance_destroy(obj_roomtransition);
        instance_destroy(obj_mirrortransition);
        instance_destroy(obj_tiptext);
        instance_destroy(obj_maptip);
        instance_destroy(obj_roomdiscoveredtext);
    }
}

function check_ceiling()
{
    var _prevmask = mask_index;
    var _ceil = false;
    mask_index = spr_player_mask;
    
    if (scr_solid(x, y))
        _ceil = true;
    
    mask_index = _prevmask;
    return _ceil;
}

function on_slippery_slope()
{
    return scr_solid(x, y + 1, obj_slipperyplatformslope);
}

function player_collideable()
{
    return !(
		   obj_player.state == states.noclip 
		|| obj_player.state == states.levelintro 
		|| obj_player.state == states.dead 
		|| obj_player.state == states.debug 
		|| obj_player.ondeathplatform != noone 
		|| obj_player.state == states.falllocked 
		|| obj_player.state == states.endplatform 
		|| obj_player.state == states.nitrocutscene 
		|| obj_player.state == states.outhouse
	);
}

function player_bounce(_height)
{
    if (check_ceiling())
        exit;
    
    vsp = _height;
    jumpstop = 1;
    hovering = 0;
    
    if (_height < 0)
    {
        canchangedir = true;
        hovered = false;
        punchair = 1;
        
        if (hovertime > 0)
            obj_drawcontroller.hovertimerflash = 1;
        
        hovertime = 0;
        
        if (state == states.downslide || state == states.groundpound || state == states.standstillrun)
            state = states.jump;
        
        if (state == states.sprint || state == states.machslide)
            state = states.sprintjump;
        
        if (state == states.jump || state == states.sprintjump)
            sprite_index = spr_player_cratebounce;
        
        if (state != states.cartwheel && state != states.punch)
            image_index = 0;
        
        if (instance_exists(obj_playercape))
            obj_playercape.sprite_index = spr_player_capeup;
    }
    else
    {
        if (state == states.jump)
        {
            if (sprite_index == spr_player_longjump || sprite_index == spr_player_longjumpend)
                sprite_index = spr_player_longjumpend;
            else if (crouchjump)
                sprite_index = spr_player_crouchjumpend;
            else
                sprite_index = spr_player_jumpend;
        }
        
        if (state == states.downslide)
        {
            state = states.jump;
            sprite_index = spr_player_longjumpend;
        }
        
        if (state == states.sprint || state == states.sprintjump)
        {
            if (sprite_index == spr_player_longjump || sprite_index == spr_player_longjumpend)
                sprite_index = spr_player_longjumpend;
            else
                sprite_index = spr_player_mach2fall;
        }
    }
    
    var _ev = scr_fmod_soundeffectONESHOT("event:/sfx/player/bounce", x, bbox_bottom);
    fmod_studio_event_instance_set_parameter_by_name(_ev, "bouncecombo", bouncecombo, false);
    bouncecombo++;
    
    if (bouncecombo > 5)
        bouncecombo = 5;
}
