if (global.playerCharacter == 1)
    global.SaveFileName = savePath[selectedFile];
else
    global.SaveFileName = savePath[selectedFile];

global.NewFile = !filePresent[selectedFile];
global.UseOfftopic = false;
scr_saveinit();
obj_parent_player.targetRoom = hub_demohallway;
obj_parent_player.targetDoor = "A";
obj_parent_player.state = 40;

if (!instance_exists(obj_fadeoutTransition))
{
    instance_create(x, y, obj_fadeoutTransition, 
    {
        levelStart: true
    });
}

scr_get_palettes();
