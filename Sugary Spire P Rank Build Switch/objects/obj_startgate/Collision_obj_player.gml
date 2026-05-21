if (sprite_index != spr_exitgateclosed)
{
    with (obj_player)
    {
        if (key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor)
        {
            global.levelname = other.level;
            scr_levelstart(global.levelname, other.targetRoom);
            ini_open("saveData.ini");
            var ranks = ini_read_string("Ranks", string(global.levelname), "none");
            ini_close();
            global.showplaytimer = ranks != "none";
            mach2 = 0;
            obj_camera.chargecamera = 0;
            image_index = 0;
            sprite_index = spr_entergate;
            state = states.victory;
            targetDoor = other.targetDoor;
            targetRoom = other.targetRoom;
            ds_queue_clear(global.newhudmessage);
            audio_stop_all();
        }
    }
    
    if (obj_player.sprite_index == obj_player.spr_entergate)
    {
        with (obj_player)
        {
            if (animation_end())
            {
                if (!instance_exists(obj_titlecard))
                {
                    with (instance_create(x, y, obj_titlecard))
                        info = instance_nearest(x, y, obj_startgate).info;
                }
            }
        }
    }
}
