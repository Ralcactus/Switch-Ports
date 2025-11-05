///@description Init Text Groups and Models
#region Texture Groups
var groupstobeloaded = 
[
	"Default", 
	"player", 
	"hud", 
	"texture3d", 
	"effectsandparticles"
];
#endregion
#region Models
modellist = 
[
	//Platforms
	[
		"DeathPlatform", 
		"DeathPlatformWIREFRAME", 
		"AscensionPlatform"
	], 
	// Crates
	[
		"Crate", 
		"CrateQUESTION", 
		"CrateARROW", 
		"CrateNITROARROW", 
		"CrateTNT", 
		"CrateTNTTIMER1", 
		"CrateTNTTIMER2", 
		"CrateTNTTIMER3", 
		"CratePOW", 
		"CrateNITRO", 
		"CrateFLAME", 
		"CrateMASK", 
		"CrateCOUNTER", 
		"CrateSWITCHHAPPY", 
		"CrateSWITCHSAD", 
		"CrateHAPPY", 
		"CrateSAD"
	], 
	// Others
	"CrateBOUNCE", 
	"Checkpoint", 
	"CheckpointDESTROYED", 
	"ChocolatePlatform", 
	"NitroDetonator", 
	"NitroDetonatorACTIVATED", 
	"Gem", 
	"GemCOLOURED", 
	"Crystal", 
	"EndPlatform", 
	"TitleGROUND", 
	"TitleHOUSE", 
	"Outhouse", 
	"OuthouseDOOR"
];
#endregion

texturelist = array_create(0);

for (var i = 0; i < array_length(groupstobeloaded); i++)
{
    var pagetextures = texturegroup_get_textures(groupstobeloaded[i]);
    
    for (var b = 0; b < array_length(pagetextures); b++)
        array_push(texturelist, pagetextures[b]);
}

threedeeslist = variable_clone(global.levelrooms);
maplist = [];
array_copy(maplist, 0, global.levelrooms, 0, array_length(global.levelrooms) - 4);
trace(maplist);

with (obj_drawcontroller)
{
    roomTileset = array_create(array_length(other.threedeeslist), -1);
    vBuffTiles = array_create(array_length(other.threedeeslist), -1);
}

with (obj_levelmap)
    vBuffMap = array_create(array_length(other.maplist), -1);

loadedassets = 0;
loadedassetsmax = array_length(texturelist) + array_length(modellist) + array_length(threedeeslist) + array_length(maplist);
alarm[0] = 5;
trace("Loading: Begin Phase 1 (Texture Loading)");
