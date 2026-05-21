#region Enums
enum states 
{
	frozen = 0,
	normal = 1,
	titlescreen = 2,
	Nhookshot = 3,
	slap = 4,
	charge = 5,
	cheesepep = 6,
	cheeseball = 7,
	cheesepepstick = 8,
	boxxedpep = 9,
	pistolaim = 10,
	climbwall = 11,
	climbdownwall = 12,
	knightpepslopes = 13,
	portal = 14,
	secondjump = 15,
	chainsawbump = 16,
	handstandjump = 17,
	gottreasure = 18,
	knightpep = 19,
	knightpepattack = 20,
	meteorpep = 21,
	bombpep = 22,
	grabbing = 23,
	chainsawpogo = 24,
	shotgunjump = 25,
	stunned = 26,
	highjump = 27,
	chainsaw = 28,
	facestomp = 29,
	timesup = 30,
	machroll = 31,
	pistol = 32,
	shotgun = 33,
	machfreefall = 34,
	Throw = 35,
	superslam = 36,
	slam = 37,
	skateboard = 38,
	grind = 39,
	grab = 40,
	punch = 41,
	backkick = 42,
	uppunch = 43,
	shoulder = 44,
	backbreaker = 45,
	bossdefeat = 46,
	bossintro = 47,
	ufofloat = 48,
	ufodash = 49,
	pizzathrow = 50,
	gameover = 51,
	Sjumpland = 52,
	freefallprep = 53,
	runonball = 54,
	boulder = 55,
	keyget = 56,
	tackle = 57,
	slipnslide = 58,
	ladder = 59,
	jump = 60,
	victory = 61,
	comingoutdoor = 62,
	Sjump = 63,
	Sjumpprep = 64,
	crouch = 65,
	crouchjump = 66,
	crouchslide = 67,
	mach1 = 68,
	mach2 = 69,
	mach3 = 70,
	machslide = 71,
	bump = 72,
	hurt = 73,
	freefall = 74,
	freefallland = 75,
	hang = 76,
	door = 77,
	barrelnormal = 78,
	barrelfall = 79,
	barrelmach1 = 80,
	barrelmach2 = 81,
	barrelfloat = 82,
	barrelcrouch = 83,
	barrelslipnslide = 84,
	barrelroll = 85,
	current = 86,
	finishingblow = 87,
	cotton = 88,
	uppercut = 89,
	pal = 90,
	shocked = 91,
	bushdisguise = 92,
	parry = 93,
	talkto = 94,
	puddle = 95,
	tumble = 96,
	cottondrill = 97,
	cottonroll = 98,
	fling = 99,
	breakdance = 100,
	minecart = 101,
	squished = 102,
	machtumble = 103,
	pizzanosidejump = 104,
	pizzanomach = 105,
	pizzanokungfu = 106,
	pizzanopummel = 107,
	fireass = 108,
	geyser = 109,
	actor = 110,
	donothing = 111,
	changing = 112,
	coneboyattack = 113,
	coneboydive = 114,
	coneboyinhale = 115,
	coneboykick = 116,
	gumbobpropeller = 117,
	gumbobmixnbrew = 118,
	twirl = 119,
	machtwirl = 120,
	pizzanoshoulderbash = 121,
	pizzanowalljump = 122,
	mini = 123,
	smirk = 124,
	flushed = 125,
	hooks = 126,
	trick = 127,
	noclip = 128,
	costumenormal = 129,
	costumegrab = 130,
	costumebreeze = 131,
	costumechuck = 132,
	bottlerocket = 133,
	holdbomb = 134,
	bombgroundpound = 135,
	bombrun = 136,
	donut = 137,
	drown = 138,
	climbceiling = 139,
	frostburn = 140,
	frostburnwallrun = 141,
	frostburnspin = 142,
	frostburnbump = 143,
	seacream = 144,
	seacreamjump = 145,
	seacreamstick = 146,
	gumballoon = 147,
	rupertnormal = 148,
	rupertslide = 149,
	rupertjump = 150,
	rupertstick = 151,
	fucking = 152,
	honey = 153,
	supergrab = 154,
	tv_transition = 155,
	tv_expression = 156,
}

enum baddiestate 
{
	idle = 0,
	charge = 1, 
	turn = 2, //
	walk = 3,
	land = 4,
	hit = 5,
	stun = 6,
	Throw = 7,
	grabbed = 8,//
	scared = 9, 
	frozen = 10,
	shake = 11,
	panicwait = 12,
	secretwait = 13,
	inhaled = 14,
	cherrywait = 15,
	cherryactive = 16,
	applejimBash = 17,
	kick = 18,
	slugidle = 19,
	slugjump = 20,
	slugparry = 21,
	float = 22,
	theif = 23,
	eyescreamwait = 24,
	eyescream = 25,
	rage = 26,
	intro = 27,
}

enum cardtype 
{
	up = 0,
	down = 1,
	left = 2,
	right = 3,
	linear = 4,
	interp = 5,
	waving = 6,
	shake = 7,
	none = 8,
}
#endregion

function scr_playerrespawn(usetechdiff = true)
{
    if (!usetechdiff)
    {
        if (state != states.gameover && state != states.actor && state != states.fling && !place_meeting(x, y, obj_vertical_hallway) && !instance_exists(obj_fadeout) && room != outer_room2 && room != timesuproom && room != rank_room)
        {
            var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
            var _checkpointReal = noone;
            
            with (obj_checkpoint)
            {
                if (Checkpointactivated == true)
                    _checkpointReal = id;
            }
            
            if (instance_exists(_checkpoint) && _checkpoint.Checkpointactivated == true)
            {
                x = _checkpoint.x;
                y = _checkpoint.y;
                instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
            }
            else if (instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated == true)
            {
                x = _checkpointReal.x;
                y = _checkpointReal.y;
                instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
            }
            else
            {
                x = roomstartx;
                y = roomstarty;
                instance_create(roomstartx, roomstarty, obj_poofeffect);
            }
            
            if (instance_exists(obj_train)) //Train Restart
            {
                with (obj_train)
                {
                    x = xstart;
                    y = ystart;
                    image_xscale = start_xscale;
                    image_index = 0;
                    sprite_index = spr_spray;
                    vsp = 0;
                    movespeed = 10;
                    state = trainstate.idle;
                }
            }
            
            state = states.hurt;
            alarm[8] = 30;
            alarm[7] = 60;
            hurted = 1;
            sprite_index = spr_hurt;
            movespeed = 0;
            vsp = -3;
        }
    }
    else if (!instance_exists(obj_techdiff))
        instance_create(x, y, obj_techdiff);
}

function scr_playerstate()
{
    var _stateFunction = undefined;
    
    switch (state)
    {
        case states.normal:
            _stateFunction = state_player_normal;
            break;
        
        case states.titlescreen:
            _stateFunction = state_player_titlescreen;
            break;
        
        case states.Nhookshot:
            _stateFunction = scr_playerN_hookshot;
            break;
        
        case states.slap:
            _stateFunction = state_player_slap;
            break;
        
        case states.charge:
            _stateFunction = state_player_charge;
            break;
        
        case states.cheesepep:
            _stateFunction = state_player_cheesepep;
            break;
        
        case states.cheeseball:
            _stateFunction = state_player_cheeseball;
            break;
        
        case states.cheesepepstick:
            _stateFunction = state_player_cheesepepstick;
            break;
        
        case states.boxxedpep:
            _stateFunction = state_player_boxxedpep;
            break;
        
        case states.pistolaim:
            _stateFunction = state_player_pistolaim;
            break;
        
        case states.climbwall:
            _stateFunction = state_player_climbwall;
            break;
        
        case states.climbdownwall:
            _stateFunction = state_player_climbdownwall;
            break;
        
        case states.knightpepslopes:
            _stateFunction = state_player_knightpepslopes;
            break;
        
        case states.portal:
            _stateFunction = state_player_portal;
            break;
        
        case states.secondjump:
            _stateFunction = state_player_secondjump;
            break;
        
        case states.chainsawbump:
            _stateFunction = state_player_chainsawbump;
            break;
        
        case states.handstandjump:
            _stateFunction = state_player_handstandjump;
            break;
        
        case states.gottreasure:
            _stateFunction = state_player_gottreasure;
            break;
        
        case states.knightpep:
            _stateFunction = state_player_knightpep;
            break;
        
        case states.knightpepattack:
            _stateFunction = state_player_knightpepattack;
            break;
        
        case states.meteorpep:
            _stateFunction = state_player_meteorpep;
            break;
        
        case states.bombpep:
            _stateFunction = state_player_bombpep;
            break;
        
        case states.grabbing:
            _stateFunction = state_player_grabbing;
            break;
        
        case states.chainsawpogo:
            _stateFunction = state_player_chainsawpogo;
            break;
        
        case states.shotgunjump:
            _stateFunction = state_player_shotgunjump;
            break;
        
        case states.stunned:
            _stateFunction = state_player_stunned;
            break;
        
        case states.highjump:
            _stateFunction = state_player_highjump;
            break;
        
        case states.chainsaw:
            _stateFunction = state_player_chainsaw;
            break;
        
        case states.facestomp:
            _stateFunction = state_player_facestomp;
            break;
        
        case states.timesup:
            _stateFunction = state_player_timesup;
            break;
        
        case states.machroll:
            _stateFunction = state_player_machroll;
            break;
        
        case states.pistol:
            _stateFunction = state_player_pistol;
            break;
        
        case states.shotgun:
            _stateFunction = state_player_shotgun;
            break;
        
        case states.machfreefall:
            _stateFunction = state_player_machfreefall;
            break;
        
        case states.Throw:
            _stateFunction = state_player_throw;
            break;
        
        case states.superslam:
            _stateFunction = state_player_superslam;
            break;
        
        case states.slam:
            _stateFunction = state_player_slam;
            break;
        
        case states.skateboard:
            _stateFunction = state_player_skateboard;
            break;
        
        case states.grind:
            _stateFunction = state_player_grind;
            break;
        
        case states.grab:
            _stateFunction = state_player_grab;
            break;
        
        case states.punch:
            _stateFunction = state_player_punch;
            break;
        
        case states.backkick:
            _stateFunction = state_player_backkick;
            break;
        
        case states.uppunch:
            _stateFunction = state_player_uppunch;
            break;
        
        case states.shoulder:
            _stateFunction = state_player_shoulder;
            break;
        
        case states.backbreaker:
            _stateFunction = state_player_backbreaker;
            break;
        
        case states.bossdefeat:
            _stateFunction = state_player_bossdefeat;
            break;
        
        case states.bossintro:
            _stateFunction = state_player_bossintro;
            break;
        
        case states.ufofloat:
            _stateFunction = state_player_ufofloat;
            break;
        
        case states.ufodash:
            _stateFunction = state_player_ufodash;
            break;
        
        case states.pizzathrow:
            _stateFunction = state_player_pizzathrow;
            break;
        
        case states.gameover:
            _stateFunction = state_player_gameover;
            break;
        
        case states.Sjumpland:
            _stateFunction = state_player_Sjumpland;
            break;
        
        case states.freefallprep:
            _stateFunction = state_player_freefallprep;
            break;
        
        case states.runonball:
            _stateFunction = state_player_runonball;
            break;
        
        case states.boulder:
            _stateFunction = state_player_boulder;
            break;
        
        case states.keyget:
            _stateFunction = state_player_keyget;
            break;
        
        case states.tackle:
            _stateFunction = state_player_tackle;
            break;
        
        case states.slipnslide:
            _stateFunction = state_player_slipnslide;
            break;
        
        case states.ladder:
            _stateFunction = state_player_ladder;
            break;
        
        case states.jump:
            _stateFunction = state_player_jump;
            break;
        
        case states.victory:
            _stateFunction = state_player_victory;
            break;
        
        case states.comingoutdoor:
            _stateFunction = state_player_comingoutdoor;
            break;
        
        case states.Sjump:
            _stateFunction = state_player_Sjump;
            break;
        
        case states.Sjumpprep:
            _stateFunction = state_player_Sjumpprep;
            break;
        
        case states.crouch:
            _stateFunction = state_player_crouch;
            break;
        
        case states.crouchjump:
            _stateFunction = state_player_crouchjump;
            break;
        
        case states.crouchslide:
            _stateFunction = state_player_crouchslide;
            break;
        
        case states.mach1:
            _stateFunction = state_player_mach1;
            break;
        
        case states.mach2:
            _stateFunction = state_player_mach2;
            break;
        
        case states.mach3:
            _stateFunction = state_player_mach3;
            break;
        
        case states.machslide:
            _stateFunction = state_player_machslide;
            break;
        
        case states.bump:
            _stateFunction = state_player_bump;
            break;
        
        case states.hurt:
            _stateFunction = state_player_hurt;
            break;
        
        case states.freefall:
            _stateFunction = state_player_freefall;
            break;
        
        case states.freefallland:
            _stateFunction = state_player_freefallland;
            break;
        
        case states.hang:
            _stateFunction = state_player_hang;
            break;
        
        case states.door:
            _stateFunction = state_player_door;
            break;
        
        case states.barrelnormal:
            _stateFunction = state_player_barrelnormal;
            break;
        
        case states.barrelfall:
            _stateFunction = state_player_barrelfall;
            break;
        
        case states.barrelmach1:
            _stateFunction = state_player_barrelmach1;
            break;
        
        case states.barrelmach2:
            _stateFunction = state_player_barrelmach2;
            break;
        
        case states.barrelfloat:
            _stateFunction = state_player_barrelfloat;
            break;
        
        case states.barrelcrouch:
            _stateFunction = state_player_barrelcrouch;
            break;
        
        case states.barrelslipnslide:
            _stateFunction = state_player_barrelslipnslide;
            break;
        
        case states.barrelroll:
            _stateFunction = state_player_barrelroll;
            break;
        
        case states.current:
            _stateFunction = state_player_current;
            break;
        
        case states.finishingblow:
            _stateFunction = state_player_finishingblow;
            break;
        
        case states.cotton:
            _stateFunction = state_player_cotton;
            break;
        
        case states.uppercut:
            _stateFunction = state_player_uppercut;
            break;
        
        case states.pal:
            _stateFunction = state_player_pal;
            break;
        
        case states.shocked:
            _stateFunction = state_player_shocked;
            break;
        
        case states.bushdisguise:
            _stateFunction = state_player_bushdisguise;
            break;
        
        case states.parry:
            _stateFunction = state_player_parry;
            break;
        
        case states.tumble:
            _stateFunction = state_player_tumble;
            break;
        
        case states.talkto:
            _stateFunction = state_player_talkto;
            break;
        
        case states.puddle:
            _stateFunction = state_player_puddle;
            break;
        
        case states.cottondrill:
            _stateFunction = state_player_cottondrill;
            break;
        
        case states.cottonroll:
            _stateFunction = state_player_cottonroll;
            break;
        
        case states.fling:
            _stateFunction = state_player_fling;
            break;
        
        case states.breakdance:
            _stateFunction = state_player_breakdance;
            break;
        
        case states.gumbobpropeller:
            _stateFunction = scr_gumbob_propeller;
            break;
        
        case states.gumbobmixnbrew:
            _stateFunction = scr_gumbob_mixnbrew;
            break;
        
        case states.minecart:
            _stateFunction = state_player_minecart;
            break;
        
        case states.fireass:
            _stateFunction = state_player_fireass;
            break;
        
        case states.squished:
            _stateFunction = state_player_squished;
            break;
        
        case states.machtumble:
            _stateFunction = state_player_machtumble;
            break;
        
        case states.pizzanomach:
            _stateFunction = scr_mach_pizzano;
            break;
        
        case states.pizzanosidejump:
            _stateFunction = scr_rocketfist_pizzano;
            break;
        
        case states.pizzanokungfu:
            _stateFunction = scr_pizzano_kungfu;
            break;
        
        case states.pizzanopummel:
            _stateFunction = scr_pizzano_pummel;
            break;
        
        case states.coneboyattack:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case states.coneboydive:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case states.coneboyinhale:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case states.coneboykick:
            _stateFunction = scr_coneboy_kick;
            break;
        
        case states.geyser:
            _stateFunction = state_player_geyser;
            break;
        
        case states.twirl:
            _stateFunction = scr_pizzano_twirl;
            break;
        
        case states.machtwirl:
            _stateFunction = scr_pizzano_machtwirl;
            break;
        
        case states.pizzanoshoulderbash:
            _stateFunction = scr_pizzano_shoulderbash;
            break;
        
        case states.pizzanowalljump:
            _stateFunction = scr_pizzano_wallcling;
            break;
            break;
        
        case states.actor:
            _stateFunction = state_player_actor;
            break;
        
        case states.changing:
            _stateFunction = state_player_changing;
            break;
        
        case states.donothing:
            _stateFunction = state_player_donothing;
            break;
        
        case states.mini:
            _stateFunction = state_player_mini;
            break;
        
        case states.flushed:
            _stateFunction = state_player_flushed;
            break;
        
        case states.drown:
            _stateFunction = state_player_drown;
            break;
        
        case states.frozen:
            _stateFunction = state_player_frozen;
            break;
        
        case states.hooks:
            _stateFunction = state_player_hooks;
            break;
        
        case states.trick:
            _stateFunction = state_player_trick;
            break;
        
        case states.noclip:
            _stateFunction = state_player_noclip;
            break;
        
        case states.costumenormal:
            _stateFunction = state_player_costumenormal;
            break;
        
        case states.costumegrab:
            _stateFunction = state_player_costumegrab;
            break;
        
        case states.costumechuck:
            _stateFunction = state_player_costumechuck;
            break;
        
        case states.costumebreeze:
            _stateFunction = state_player_costumebreeze;
            break;
        
        case states.bottlerocket:
            _stateFunction = state_player_bottlerocket;
            break;
        
        case states.donut:
            _stateFunction = state_player_donut;
            break;
        
        case states.holdbomb:
            _stateFunction = state_player_holdbomb;
            break;
        
        case states.climbceiling:
            _stateFunction = state_player_climbceiling;
            break;
        
        case states.frostburn:
            _stateFunction = state_player_frostburn;
            break;
        
        case states.frostburnwallrun:
            _stateFunction = state_player_frostburnwallrun;
            break;
        
        case states.frostburnspin:
            _stateFunction = state_player_frostburnspin;
            break;
        
        case states.seacream:
            _stateFunction = state_player_seacream;
            break;
        
        case states.seacreamjump:
            _stateFunction = state_player_seacreamjump;
            break;
        
        case states.seacreamstick:
            _stateFunction = state_player_seacreamstick;
            break;
        
        case states.frostburnbump:
            _stateFunction = state_player_frostburnbump;
            break;
        
        case states.gumballoon:
            _stateFunction = state_player_gumballoon;
            break;
        
        case states.rupertnormal:
            _stateFunction = state_player_rupertnormal;
            break;
        
        case states.rupertslide:
            _stateFunction = state_player_rupertslide;
            break;
        
        case states.rupertjump:
            _stateFunction = state_player_rupertjump;
            break;
        
        case states.rupertstick:
            _stateFunction = state_player_rupertstick;
            break;
        
        case states.honey:
            _stateFunction = state_player_honey;
            break;
        
        case states.supergrab:
            _stateFunction = state_player_supergrab;
            break;
        
        case states.smirk:
            show_error("Smirk old code lmao", false);
            _stateFunction = state_player_ufodash;
            break;
    }
    
    stateName = "states.undefined";
    
    if (!is_undefined(_stateFunction))
    {
        _stateFunction();
        stateName = "states." + string_extract(script_get_name(_stateFunction), "_", 1) + string_extract(script_get_name(_stateFunction), "_", 3);
    }
}

function scr_taunt_storeVariables()
{
    tauntStored = 
    {
        state: state,
        hsp: hsp,
        prevHsp: prevHsp,
        vsp: vsp,
        prevVsp: prevVsp,
        movespeed: movespeed,
        verticalMovespeed: verticalMovespeed,
        sprite_index: sprite_index,
        image_index: image_index
    };
}

function scr_taunt_setVariables()
{
    state = tauntStored.state;
    hsp = tauntStored.hsp;
    prevHsp = tauntStored.prevHsp;
    vsp = tauntStored.vsp;
    prevVsp = tauntStored.prevVsp;
    movespeed = tauntStored.movespeed;
    verticalMovespeed = tauntStored.verticalMovespeed;
    sprite_index = tauntStored.sprite_index;
    image_index = tauntStored.image_index;
}
