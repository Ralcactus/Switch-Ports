ds_map_destroy(global.inputs);
global.inputs = -1;

ds_map_destroy(global.loadedModels);
global.loadedModels = -1;

ds_list_destroy(global.instancelist);
global.instancelist = -1;

ds_map_destroy(global.saveroom);
global.saveroom = -1;

ds_map_destroy(global.respawnroom);
global.saveroom = -1;

font_delete(global.font);
font_delete(global.keyfont);
font_delete(global.speedruntimerfont);
font_delete(global.namefont);
font_delete(global.rolefont);
font_delete(global.manualfont);

global.altMaterials = undefined;
