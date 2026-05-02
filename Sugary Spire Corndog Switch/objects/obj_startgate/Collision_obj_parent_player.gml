if (sprite_index == spr_exitgateclosed || instance_exists(obj_titlecard))
    exit;

with (obj_parent_player)
{
    var other_id = other.id;
    
    if (key_up && grounded && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_63 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65) && !instance_exists(obj_fadeoutTransition) && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_57)
    {
        scr_levelstart(other.level, other.targetRoom);
        ini_open("saveData.ini");
        var ranks = ini_read_string("Ranks", string(global.levelname), "none");
        ini_close();
        global.showplaytimer = ranks != "none";
        machTwo = 0;
        obj_camera.chargeCameraX = 0;
        image_index = 0;
        sprite_index = spr_entergate;
        state = UnknownEnum.Value_56;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        ds_queue_clear(global.newhudmessage);
        stop_music(false);
    }
    
    if (sprite_index == spr_entergate && animation_end() && !instance_exists(obj_titlecard))
    {
		if (targetRoom != tutorial_1){
	        with (instance_create(x, y, obj_titlecard))
	            info = other_id.info;
		}
		else{
			if (!instance_exists(obj_fadeoutTransition))
			{
			    instance_create(x, y, obj_fadeoutTransition, 
			    {
			        levelStart: true
			    });
			}
		}
    }
}
