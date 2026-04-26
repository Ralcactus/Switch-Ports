// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fmodpath_convert(sound){
	//check if its a player sound
	var gm_sound = convert_playersound(sound);
	
	//if player sound returns empty, skip to the next batch, if still missing skip to next, etc
	if (gm_sound = audio_empty)
		gm_sound = convert_othersound(sound);
		
	if (gm_sound = audio_empty)
		gm_sound = convert_musicsound(sound);
	

	//sound wasn't found
	if (gm_sound = audio_empty)
		show_debug_message("Missing sound: " + sound);
		
	return gm_sound;
}

//Player sounds
function convert_playersound(sound){
	var gm_sound = audio_empty;
	
	switch (sound){
		case "event:/SFX/player/step": //step
			gm_sound = sfx_playerstep;
		break;
		
		case "event:/SFX/player/punch": //enemy punch
			gm_sound = sfx_punch;
		break;
		
		case "event:/SFX/player/bumpwall": //wall bump
			gm_sound = sfx_bumpwall;
		break;
		
		case "event:/SFX/player/groundpound": //groundpound
			gm_sound = sfx_groundpound;
		break;
		
		case "event:/SFX/player/suplexdash": //grab
			gm_sound = sfx_suplexdash;
		break;
		
		case "event:/SFX/player/jump": //jump
			gm_sound = sfx_pz_jump;
		break;
		
		case "event:/SFX/player/wallKickCancel": //wallkick cancel
			gm_sound = sfx_wallkickcancel;
		break;
		
		case "event:/SFX/player/taunt": //taunt
			gm_sound = sfx_Tauntlonger;
		break;
		
		case "event:/SFX/player/grabcancel": //grab cancel
			gm_sound = sfx_rollgetup;
		break;
		
		case "event:/SFX/player/breakdanceSpawn": //Breakdance spawn
			gm_sound = sfx_breakdance;
		break;
		
		case "event:/SFX/player/breakdance": //breakdance music
			gm_sound = boombox;
		break;
		
		case "event:/SFX/general/enterpainting": //enter painting
			gm_sound = PaintingReal;
		break;
		
		case "event:/SFX/player/break": //stop mach
			gm_sound = enginesoundskid;
		break;		
		
		case "event:/SFX/player/mach": //mach
			gm_sound = sfx_mach1;
		break;
		
		case "event:/SFX/player/machslideboost": //mach turn
			gm_sound = pz_machdrift;
		break;
	}
	
	return gm_sound;
}

//I don't know where these would go
function convert_othersound(sound){
	var gm_sound = audio_empty;
	
	switch (sound){
		case "event:/SFX/fileselect/curtain": //main menu curtain
			gm_sound = sfx_curtains;
		break;
		
		case "event:/SFX/fileselect/fileselect": //main menu select
			gm_sound = choose(fileselect1, fileselect2, fileselect3);
		break;
		
		case "event:/SFX/general/paperballhit": //paper ball and main menu move
			gm_sound = sfx_paper_throw_into_airfuller_2_101814;
		break;
		
		case "event:/SFX/general/collectbig": //Big collect sound and mainmenu select noise
			gm_sound = sfx_bigcollectget;
		break;	
		
		case "event:/SFX/general/door": //Room change 
			gm_sound = sfx_door;
		break;		
		
		case "event:/SFX/general/switchstart": //Clothes switch
			gm_sound = switch1;
		break;
		
		case "event:/SFX/hub/painterThinkAngry": //Painter NPC think angry
			gm_sound = choose(painter7, painter8, painter9, painter10);
		break;
		
		case "event:/SFX/hub/painterThinkHappy": //Painter NPC think happy
			gm_sound = choose(painter1, painter2, painter3, painter13, painter11, painter12);
		break;
		
		case "event:/SFX/hub/painterThinkSad": //Painter NPC think sad
			gm_sound = choose(painter4, painter5, painter6);
		break;	
		
		case "event:/SFX/general/paintingexit": //Exit painting
			gm_sound = paintignexitttt;
		break;
		
		case "event:/SFX/hub/news": //News guy
			gm_sound = choose(newsguy_01, newsguy_02, newsguy_03, newsguy_04, newsguy_05, newsguy_06, newsguy_07);
		break;	
			
		case "event:/SFX/player/goopfloor": //Little painter stamp thing
			gm_sound = sfx_gooptouch;
		break;
	}
	
	return gm_sound;
}
	
//Music
function convert_musicsound(sound){
	var gm_sound = audio_empty;
	
	switch (sound){
		case "event:/music/titlescreen_demo": //main menu
			gm_sound = Exhibition_Night__M_;
		break;
		
		case "event:/music/hub": //hub
			gm_sound = SK_hub_theme;
		break;			

		case "event:/music/escape": //escape
			gm_sound = glucodetry4;
		break;	
		
		case "event:/music/credits": //credits
			gm_sound = creditsloopnew;
		break;	
		
		case "event:/music/tutorial": //tutorial
			gm_sound = mu_entertainer;
		break;	
		
		case "event:/music/painterBrain": //painters brain
			gm_sound = Painter_s_Brain__Stewart_Keller_;
		break;	
		
		case "event:/music/harry": //harry
			gm_sound = Arkoudaphobia_M_Stewart_Keller;
		break;			
		
		case "event:/music/w1/entryway": //entryway
			gm_sound = entryway;
		break;
		
		case "event:/music/w1/entryway_secret": //entryway secret
			gm_sound = mu_wafflesecret;
		break;
		
		case "event:/music/w1/cottontown": //cotton town
			gm_sound = steamy;
		break;	
		
		case "event:/music/w1/cottontown_secret": //cotton town secret
			gm_sound = mu_steamysecret;
		break;
		
		case "event:/music/w2/molasses": //molasses swamp
			gm_sound = gennyswamp;
		break;
		
		case "event:/music/w2/molasses_secret": //molasses swamp secret
			gm_sound = mu_swampsecret;
		break;
		
		case "event:/music/w1/mines": //mines secret
			gm_sound = mu_mineshaft1;
		break;
		
		case "event:/music/w1/mines_secret": //mines secret
			gm_sound = mu_minessecret;
		break;
			
		case "event:/music/w1/entryway_titlecard": //Entryway titlecard
			gm_sound = Entryway__1_;
		break;	
			
		case "event:/music/w1/cottontown_titlecard": //CottonTown titlecard
			gm_sound = Cottontown448;
		break;	
			
		case "event:/music/w2/molasses_titlecard": //Molasses Swamp titlecard
			gm_sound = Swamp;
		break;
			
		case "event:/music/w2/mines_titlecard": //Mines titlecard
			gm_sound = Mines392;
		break;
		
		case "event:/SFX/general/collect": //Collect noise
			gm_sound = sfx_collect2;
		break;
		
		case "event:/SFX/general/breakblock": //Block break
			gm_sound = choose(sfx_breakblock1, sfx_breakblock2);
		break;
		
		case "event:/SFX/enemies/projectile": //Enemy projectile
			gm_sound = sfx_enemyprojectile;
		break;
		
		case "event:/SFX/enemies/grabbed": //Enemy grabbed
			gm_sound = sound_slaphit;
		break;
		
		case "event:/SFX/enemies/stomp": //Enemy stomp
			gm_sound = sfx_stompenemy;
		break;
		
		case "event:/SFX/enemies/killingblow": //Enemy final hit
			gm_sound = sfx_killingblow;
		break;
		
		case "event:/SFX/enemies/kill": //Enemy killed
			gm_sound = sfx_killenemy;
		break;
		
		case "event:/SFX/ui/kashingcombo": //Combo done
			gm_sound = Kashing;
		break;
		
		case "event:/SFX/general/collectfollower": //Combo done
			gm_sound = confectiget;
		break;
		
		case "event:/SFX/general/secretexit": //Secret exit
			gm_sound = SECRET_SLOP_EXIT;
		break;
		
		case "event:/SFX/general/secretenter": //Secret enter
			gm_sound = SECRET_SLOP_ENTER;
		break;
		
		case "event:/SFX/general/secretfound": //Secret found
			gm_sound = sfx_secretfound;
		break;
		
		case "event:/SFX/ui/comboup": //Combo level up
			gm_sound = choose(comboup1, comboup2, comboup4);
		break;
		
		case "event:/SFX/general/clutterhitmetal": //Destroy metal clutter
			gm_sound =sfx_metalclutterhit;
		break;
		
		case "event:/SFX/general/breakmetal": //Metal block destroy
			gm_sound = choose(blockbreak, sfx_breakmetal);
		break;
		
		case "event:/SFX/general/clutterhit": //Destroy clutter
			gm_sound = sfx_clutterhit;
		break;
		
		case "event:/SFX/general/toppinhelp": //confecti help sound
			gm_sound = toppinhelp;
		break;
	}
	
	return gm_sound;
}