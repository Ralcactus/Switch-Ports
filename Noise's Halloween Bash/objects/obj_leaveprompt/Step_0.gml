if (game_paused())
    exit;

if (fadein)
{
    if (input_check_pressed("jump"))
    {
        input_verb_consume(["jump", "attack", "down"]);
        fadein = false;
        obj_endplatplayer.sendtojeg = obj_player.currcheckpoint.id == noone;
        obj_endplatplayer.dothing = true;
        obj_drawcontroller.camForward = 0;
        obj_drawcontroller.camUp = 0;
        event_stop(global.music.event, false);
        
        with (obj_music)
        {
            fmod_studio_system_set_parameter_by_name("bringtorank", 0, true);
            play_music(RankRoom, false);
        }
        
        save_open();
        
        if (ini_read_real("PumpkinPatch", "pumpkinTotal", 0) < global.pumpkintotal)
            ini_write_real("PumpkinPatch", "pumpkinTotal", global.pumpkintotal);
        
        if (ini_read_real("PumpkinPatch", "candyCollected", 0) < global.collect)
            ini_write_real("PumpkinPatch", "candyCollected", global.collect);
        
        if (ini_read_real("PumpkinPatch", "cratesDestroyed", 0) < global.destroyedcount)
            ini_write_real("PumpkinPatch", "cratesDestroyed", global.destroyedcount);
        
        ini_write_real("PumpkinPatch", "gemData", global.gems | ini_read_real("PumpkinPatch", "gemData", 0));
        save_close();
        save_dump();
    }
    
    if (input_check_pressed("attack"))
    {
        input_verb_consume(["jump", "attack", "down"]);
        fadein = false;
        obj_player.state = states.normal;
        instance_destroy(obj_endplatplayer);
    }
}

alpha = approach(alpha, fadein, 0.05);

if (!fadein && alpha <= 0)
    instance_destroy();
