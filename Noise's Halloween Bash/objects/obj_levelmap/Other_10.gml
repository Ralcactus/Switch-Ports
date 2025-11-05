global.mapOpen = !global.mapOpen;

if (global.mapOpen)
{
    input_verb_consume(["jump", "attack", "down"]);
    openanim = 0;
    closeanim = 0;
    playerroom = room;
    playerposx = obj_player.x;
    playerposy = obj_player.y;
    checkposx = obj_player.currcheckpoint.x;
    checkposy = obj_player.currcheckpoint.y;
    swaplayer = false;
    outhoused = false;
    zoomclicktimer = 0;
    zoompitch = 5;
    
    for (var i = 0; i < array_length(roomoffset); i++)
    {
        var _room = global.levelrooms[i];
        roominfo_pumpkins[i] = count_in_room(_room, function(_room_inst, _index)
        {
            return !in_saveroom(_room_inst.id) && asset_get_index(_room_inst.object_index) == obj_pumpkin;
        });
        roominfo_crates[i] = count_in_room(_room, function(_room_inst, _index)
        {
            var _obj = asset_get_index(_room_inst.object_index);
            
            if (_obj == obj_destroyablenitroarrow)
                return !in_saveroom(string("{0}_ARROW", real(_room_inst.id)), global.respawnroom);
            else
                return !in_saveroom(_room_inst.id, global.respawnroom) && object_is_ancestor(_obj, par_crate) && _obj != obj_destroyablenitro;
        });
        roominfo_nitros[i] = count_in_room(_room, function(_room_inst, _index)
        {
            var _obj = asset_get_index(_room_inst.object_index);
            
            if (_obj == obj_destroyablenitroarrow)
                return in_saveroom(string("{0}_ARROW", real(_room_inst.id)), global.respawnroom) && !in_saveroom(string("{0}_NITRO", real(_room_inst.id)), global.respawnroom);
            
            if (_obj == obj_destroyablenitro)
                return !in_saveroom(_room_inst.id, global.respawnroom);
            
            return false;
        });
    }
}
else
{
    if (outhoused)
    {
        with (obj_player)
            instance_place(x, y, obj_outhouse).alarm[1] = 20;
    }
    
    input_verb_consume("pause");
    openanim = 1;
}

fmod_studio_bus_set_paused(fmod_studio_system_get_bus("bus:/SFX/Pausable"), global.mapOpen);
