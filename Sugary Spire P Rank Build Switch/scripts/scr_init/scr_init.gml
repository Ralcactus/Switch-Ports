function scr_setgmliverooms(_room)
{
    var _bool = false;
    if CENSORROOMS 
	{
	    switch (room_get_name(_room))
	    {
	        case "exitway_1":
	        case "exitway_2":
	        case "exitway_3":
	        case "exitway_4":
	        case "exitway_secret1":
	            _bool = true;
	            break;
	    }
	}
    return _bool;
}

// Change current config to Dev to activate DEBUG
// Press the target button on the top right to change it
#macro DEBUG true
#macro Dev:DEBUG true
#macro Playtester:DEBUG true

#macro CENSORROOMS true
#macro Dev:CENSORROOMS false
#macro Playtester:CENSORROOMS true

#macro FirstRoom rm_disclaimer
#macro Dev:FirstRoom devroom
#macro Playtester:FirstRoom rm_verify

// Utility Macros
#macro camx camera_get_view_x(view_camera[0])
#macro camy camera_get_view_y(view_camera[0])
#macro camw camera_get_view_width(view_camera[0])
#macro camh camera_get_view_height(view_camera[0])

// Scribble
scribble_anim_wave(0.5, 3, 0.5);

//Palette 
pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
//Level Stuff
global.levelname = "none";
global.firstlvlRoom = hub_w1;
global.secretfound = 0;
global.showplaytimer = false;
global.playmiliseconds = 0;
global.playseconds = 0;
global.playminutes = 0;
global.playhour = 0;
global.fill = 0;
//Hitstun
global.freezeframe = false;
global.freezeframetimer = 5;
//Shader Stuff
global.greyscalefade = 0;
//Music stuff
global.music = noone;
global.harrymusic = noone;
global.shopmusic = noone;

//Pause Music Pog
global.PAUSE_contTrack_pos = 0;

//Dialog variables
global.dialogmsg = 0;
global.dialogchoices = 0;
global.choiced = 0;
global.dialogNPC = noone;

//Dance off Timer
global.dancetimer = 0;
global.maxdancetimer = 0;
global.martian_alarmed = false;
//MusicMines
global.minesProgress = false;
// Mines TNT Blocks
#region Mines Flags.
enum GnomeFlags 
{
	PROGRESS = 0, 
	RED = 1,
	GREEN = 2,
	BLUE = 3,
	YELLOW = 4,
	WHITE = 5, 
	PURPLE = 6 
}
#endregion
global.MinesFlags[GnomeFlags.PROGRESS] = false;
global.MinesFlags[GnomeFlags.RED] = false;
global.MinesFlags[GnomeFlags.GREEN] = false;
global.MinesFlags[GnomeFlags.BLUE] = false;
global.MinesFlags[GnomeFlags.YELLOW] = false;
global.MinesFlags[GnomeFlags.WHITE] = false;
global.MinesFlags[GnomeFlags.PURPLE] = false;

//Variable that sets GMLIVE room reload stuff
global.GMLIVE_roomstart = false;
global.GMLIVE_prevroom = 0;
global.GMLIVE_realroom = 0;

//Cutscene
global.cutsceneManager = noone;	

//Combo
global.combomode = false;

//Font Funny
global.font = __scribble_font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789:- ", 1, 0);
global.smallfont = __scribble_font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-:", 1, 0);
global.creditsfont = __scribble_font_add_sprite_ext(spr_creditsfont, " ABCDEFGHIJKLMNOPQRSTUVWXYZ.!,abcdefghijklmnopqrstuvwxyz0123456789@#$%^&*(){}[]|:;'/`", 1, 0);
global.combofont = __scribble_font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0);
global.collectfont = __scribble_font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0);
global.candlefont = __scribble_font_add_sprite_ext(spr_fontcandle, "0123456789", 1, 0);
global.rankcombofont = __scribble_font_add_sprite_ext(spr_fontrankcombo, "0123456789", 1, 0);
global.bubblefont = __scribble_font_add_sprite_ext(spr_bubblefont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", 1, 0);
global.timerfont = __scribble_font_add_sprite_ext(spr_timer_font, "1234567890", 0, 6);
global.combofont = __scribble_font_add_sprite_ext(spr_combometer_font, "1234567890x", 1, 2);
global.lapfont = __scribble_font_add_sprite_ext(spr_lap_font, "1234567890", 1, 2);
global.dialogfont = __scribble_font_add_sprite_ext(spr_font_dialogue, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!?:;`'/-_+=1234567890@#$%^&*()[]", 1, 2);
global.buttonfont = __scribble_font_add_sprite_ext(spr_buttonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ$%&*()/", 1, 0);
global.promptfont = __scribble_font_add_sprite_ext(spr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 0);
global.npcfont = __scribble_font_add_sprite_ext(spr_npcfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", 1, 2);

//Shell Stuff
global.shellactivate = false;
global.showcollisions = false;
global.debugmode = false;
global.fartcounter = 0;

//Parallax
global.parallaxbg_surface = noone;
global.ParallaxMap = ds_map_create();
scr_default_parallax(true);

//Followers
global.FollowerList = ds_list_create();

// Confecti
global.mallowfollow = false;
global.crackfollow = false;
global.chocofollow = false;
global.wormfollow = false;
global.candyfollow = false;

global.janitorRudefollow = false;
global.janitorLapfollow = false;

global.janitortype = 1;
global.lapcount = 0;

//Options
ini_open("optionData.ini");
//Video
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.screenmelt = ini_read_real("Settings", "screenmelt", 1);
global.lowperformance = ini_read_real("Settings", "lowperf", 1);
global.smoothscale = ini_read_real("Settings", "smoothscale", 0);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
//Audio
global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
ini_close();
//Set Master Gain
audio_master_gain(global.masterVolume);
//Controller
global.player_input_device = -2;
global.player_input_device2 = -2;
//Camera Position
global.targetCamX = 0;
global.targetCamY = 0;
ini_open("optionData.ini");
//Resolution
switch (ini_read_real("Settings", "resolution", 1))
{
    case 0:
        window_set_size(480, 260);
        break;
    
    case 1:
        window_set_size(960, 540);
        break;
    
    case 2:
        window_set_size(1280, 720);
        break;
}

window_set_fullscreen(ini_read_real("Settings", "fullscrn", 0));
ini_close();
//Gain
audio_sound_gain(sfx_combovoice1p, 2, 0);
audio_sound_gain(sfx_combovoice2p, 2, 0);
audio_sound_gain(sfx_combovoice3p, 2, 0);
audio_sound_gain(sfx_combovoice4p, 2, 0);
audio_sound_gain(sfx_combovoice5p, 2, 0);
audio_sound_gain(sfx_combovoice6p, 2, 0);
audio_sound_gain(sfx_combovoice7p, 2, 0);
audio_sound_gain(sfx_combovoice8p, 2, 0);
//This thing
gml_release_mode(true);

//Anti Funny Room reorder
var _emptyfuckroom = room_add(); //Make room in game
room_assign(_emptyfuckroom, rm_blank);
room_instance_add(_emptyfuckroom, 0, 0, obj_eventtrigger327);

for (var i = 0; room_exists(i); i++)
{
	// it does not do gmlive
    if (scr_setgmliverooms(i))
        room_assign(i, _emptyfuckroom);
}

global.doorsave = ds_list_create();
global.afterimage_list = ds_list_create();
