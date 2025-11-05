// Retro Palette Swapper Init
pal_swap_init_system(shd_pal_swapper, shd_billboard_paletted, shd_pal_premultiply);

#region Long Lang Files
var _strfiledir = working_directory + "Data/";
var _strfile = "strings_en.json";

if (file_exists(_strfiledir + _strfile))
    strings_read(_strfiledir + _strfile);
else
    show_error(string("Fatal Error! Language File \"{0}\" Not Found!", _strfile), true);
#endregion
#region Models
DotobjSetFlipTexcoordV(true);
DotobjSetReverseTriangles(true);
reroll();
global.loadedModels = ds_map_create();
#endregion
#region Fonts
global.font = font_add_sprite_ext(spr_font, "!#$%&'()*+,-.0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~/\\", true, 0);
global.keyfont = font_add_sprite_ext(spr_keyfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ`1234567890-=[];'\\,./", false, 0);
global.speedruntimerfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:?,'", false, -4);
global.namefont = font_add_sprite_ext(spr_creditsnamefont, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.,_-+=:/\\()!&#@$%*'\"", true, 1);
global.rolefont = font_add_sprite_ext(spr_creditsrolefont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", true, 1);
global.toonfont = font_add_sprite_ext(spr_toonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,_-=+:%/!?'\"", true, 1);
global.rankcountfont = font_add_sprite_ext(spr_counterfont, "1234567890/", true, 0);
global.manualfont = font_add_sprite_ext(spr_manualfont, "!#$%&'()*+,-.0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~/\\\"", true, 1);
global.optionsdescfont = font_add_sprite_ext(spr_optionsdescfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.,'\"?!:-", true, 1);
define_font_globals();
#endregion
#region Input
global.inputs = ds_map_create();
global.inputs[? "[U]"] = "up";
global.inputs[? "[D]"] = "down";
global.inputs[? "[L]"] = "left";
global.inputs[? "[R]"] = "right";
global.inputs[? "[J]"] = "jump";
global.inputs[? "[A]"] = "attack";
global.inputs[? "[M]"] = "dash";
global.inputs[? "[S]"] = "slide";
global.inputs[? "[I]"] = "inv";
global.inputs[? "[P]"] = "pause";
global.inputs[? "[B]"] = "map";
global.inputs[? "[Z]"] = "zoomin";
global.inputs[? "[X]"] = "zoomout";
global.inputs[? "[?]"] = "any";
#endregion

global.visiblesolids = true;
global.godmode = false;
global.worldlightpos = new Vec3(-0.2, -0.7, -2);

global.levelrooms = 
[
	Patch1, 
	Patch2A, 
	Patch2B, 
	Patch3A, 
	Patch3B, 
	Patch4A, 
	Patch4B, 
	Patch5, 
	PatchDeathRoute, 
	PatchDeathRoute2, 
	PatchPerilousEntrance, 
	PatchPerilousRoute
];

global.altMaterials = {};
trace("WinRT Init Status: ", winrt_init());
